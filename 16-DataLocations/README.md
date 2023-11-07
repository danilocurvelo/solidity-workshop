# Storage, memory e calldata

As variáveis são declaradas como armazenamento, memória ou calldata para especificar explicitamente a localização dos dados.

- `storage` - a variável é uma variável de estado (armazenamento em blockchain)
- `memory` - a variável está na memória e existe enquanto uma função está sendo chamada
- `calldata` – localização de dados especial que contém argumentos da função

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // chama _f com variáveis de estado
        _f(arr, map, myStructs[1]);

        // obtém a struct de um mapping
        MyStruct storage myStruct = myStructs[1];
        // cria uma struct em memória
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // faz algo com as variáveis de estado
    }

    // Você pode retornar variáveis armazenadas em memória
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // faz algo com um array em memória
    }
}
```