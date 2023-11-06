# Hello World

`pragma` especifica a versão do compilador do Solidity.

```solidity
// SPDX-License-Identifier: MIT
// versão do compilador deve ser maior ou igual a 0.8.20 e menor que a 0.9.0
pragma solidity ^0.8.20;

contract HelloWorld {
    string public greet = "Hello World!";
}

```