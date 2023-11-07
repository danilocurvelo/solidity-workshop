// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // Variável de estado para armazenar um número
    uint public num;

    // Você precisa enviar uma transação para escrever um valor em uma variável de estado.
    function set(uint _num) public {
        num = _num;
    }

    // Você pode ler de uma variável de estado sem precisar enviar uma transação (`view`).
    function get() public view returns (uint) {
        return num;
    }
}