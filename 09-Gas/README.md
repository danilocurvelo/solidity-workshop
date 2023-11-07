# Gas

Você paga o valor `gas spent * gas price` em `ether`, onde

- `gas` é uma unidade de computação
- o gas gasto (`gas spent`) é a quantidade total de `gas` usado em uma transação
- o valor do gas (`gas price`) é quanto `ether` você está disposto a pagar por unidade de `gas` 

Transações com valor de `gas` mais alto têm maior prioridade para serem incluídas em um bloco.

O `gas` não gasto será reembolsado.

```solidity
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
```