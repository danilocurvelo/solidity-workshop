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

Código:

https://github.com/danilocurvelo/solidity-workshop/blob/c7fad40e04f3be87f8d993d4567f215cf3e24f0b/01-HelloWorld/HelloWorld.sol#L1C1-L7C2