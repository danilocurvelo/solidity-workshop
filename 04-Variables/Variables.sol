// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Variables {
    // Variáveis de estado são armazenadas no blockchain.
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        // Variáveis locais não são salvas no blockchain.
        uint i = 456;

        // Exemplos de variáveis globais
        uint timestamp = block.timestamp; // Timestamp do bloco atual 
        address sender = msg.sender; // endereço de quem enviou a transação
    }
}
