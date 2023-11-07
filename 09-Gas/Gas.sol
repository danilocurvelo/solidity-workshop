// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Gas {
    uint public i = 0;

    // Utilizar todo o gas que você envia resulta na falha da transação.
    // Mudanças de estado são revertidas.
    // Gas utilizado não é reembolsado.
    function forever() public {
        // Aqui vamos todar um loop infinito até todas as unidades de gas serem gastas
        // e a transação vai falhar.
        while (true) {
            i += 1;
        }
    }
}