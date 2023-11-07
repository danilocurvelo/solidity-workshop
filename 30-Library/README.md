# Biblioteca

Bibliotecas são semelhantes a contratos, mas você não pode declarar nenhuma variável de estado e não pode enviar ether.

Uma biblioteca será incorporada ao contrato se todas as funções da biblioteca forem internas.

Caso contrário, a biblioteca deverá ser implantada e vinculada antes da implantação do contrato.

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

// Função para deletar o elemento no indice indicado e reorganizar o array
// para que não tenha gaps entre os elementos.
library Array {
    function remove(uint[] storage arr, uint index) public {
        // Move o último elemento para a posição de deleção.
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint[];

    uint[] public arr;

    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) {
            arr.push(i);
        }

        arr.remove(1);

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }
}
```