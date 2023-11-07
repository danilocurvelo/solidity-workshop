// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Function {
    // Funções podem retornar múltiplos valores.
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    // Valores de retorno podem ser nomeados.
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    // Valores de retorno podem ser atribuídos ao seus nomes.
    // Neste caso a instrução return pode ser omitida.
    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Você pode usar a operação de desmembramento ao chamar outra
    // função que retorna múltiplos valores.
    function destructuringAssignments()
        public
        pure
        returns (uint, bool, uint, uint, uint)
    {
        (uint i, bool b, uint j) = returnMany();

        // Alguns valores podem ser ignorados
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Não pode utilizar mapping para entrada nem saída

    // Pode-se utilizar array para entrada
    function arrayInput(uint[] memory _arr) public {}

    // Pode-se utilizar array para saída
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}

// Invocando funções com entrada chave-valor 
contract XYZ {
    function someFuncWithManyInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {}

    function callFunc() external pure returns (uint) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint) {
        return
            someFuncWithManyInputs({a: address(0), b: true, c: "c", x: 1, y: 2, z: 3});
    }
}