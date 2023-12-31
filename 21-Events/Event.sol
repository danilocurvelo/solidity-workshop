// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Event {
    // Declaração do evento
    // Até 3 parâmetros podem ser indexados.
    // Parâmetros indexados auxiliam a filtragem dos eventos a partir do parâmetro indexado.
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}