# Erros

Um erro irá desfazer todas as alterações feitas no estado durante uma transação.

Você pode gerar um erro chamando `require`, `revert` ou `assert`.

- `require` é usado para validar entradas e condições antes da execução.
- `revert` é semelhante ao `require`. Veja o código abaixo para entender mellhor.
- `assert` é usado para verificar código que nunca deve ser falso (`false`). A falha na afirmação provavelmente significa que há um _bug_.

Use erros personalizados!

```solidity
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
```

Outro exemplo:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2 ** 256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // balance + _amount não resulta em overflow se balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        // balance - _amount não resulta em underflow se balance >= _amount
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}
```