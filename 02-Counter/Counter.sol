// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint public count;

    // Função para obter (get) o valor atual do contador
    function get() public view returns (uint) {
        return count;
    }

    // Função para incrementar em 1 o contador
    function inc() public {
        count += 1;
    }

    // Função para decrementar em 1 o contador
    function dec() public {
        // Essa função irá falhar se count = 0
        count -= 1;
    }
}