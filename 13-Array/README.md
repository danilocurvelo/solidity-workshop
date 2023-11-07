# Array

Arrays pode mter tamanho fixo ou dinâmico.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Array {
    // Várias formas de inicializar um array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // Array de tamanho fixo, todos os elementos se inicializam com 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity pode retornar a array por completo.
    // Mas deve ser evitada pois esse tipo de array 
    // pode crescer indefinidamente.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // Adiciona ao fim do array
        // Isso irá aumentar o tamanho do array em 1.
        arr.push(i);
    }

    function pop() public {
        // Remove um último elemento do array
        // Isso irá diminuir o tamanho do array em 1.
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Deleção não muda o tamanho do array
        // Deletar reseta o valor no índice indicado para o valor padrão,
        // neste caso, 0.
        delete arr[index];
    }

    function examples() external {
        // cria um array em memória, somente tamanho fixo.
        uint[] memory a = new uint[](5);
    }
}
```