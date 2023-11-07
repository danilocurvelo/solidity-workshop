// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Error {
    function testRequire(uint _i) public pure {
        // require deve ser usado para validar condições como:
        // - entradas
        // - condições antes da execução
        // - valores de retorno da chamada de outras funções
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // revert é útil quando a condição para ser verificada é complexa.
        // Esse código faz examente a mesma coisa que o exemplo anterior.
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        // assert deve ser usado somente para testar erros internos
        // e invariâncias.

        // Aqui verificamos que num sempre é igual a 0
        // já que não é possível atualizar o valor de num
        assert(num == 0);
    }

    // erro customizado
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}