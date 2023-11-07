# Funções `view` e `pure`

A função com modificador `view` declara que nenhum estado será alterado.

A função com modificador `pure` declara que nenhuma variável de estado será alterada ou lida.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ViewAndPure {
    uint public x = 1;

    // Prometa que não irá modificar o estado!
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Prometa que não vai modificar nem ler o estado!
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}
```