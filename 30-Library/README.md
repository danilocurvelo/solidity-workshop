# Biblioteca

Bibliotecas são semelhantes a contratos, mas você não pode declarar nenhuma variável de estado e não pode enviar ether.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Math {
    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (valor default)
    }
}

contract TestMath {
    function testSquareRoot(uint x) public pure returns (uint) {
        return Math.sqrt(x);
    }
}
```