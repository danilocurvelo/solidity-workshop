# For e While

O Solidity suporta laços de repetição `for`, `while` e `do while`.

Não escreva loops inifinitos, pois isso pode atingir o limite de gas, causando falha na transação.

Pelo motivo acima, os loops `while` e `do while` raramente são utilizados.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Loop {
    function loop() public {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }
}
```