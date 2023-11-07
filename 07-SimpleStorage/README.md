# Lendo e escrevendo uma variável de estado

Para escrever ou atualizar uma variável de estado você precisa **enviar uma transação**.

Por outro lado, você pode ler variáveis de estado gratuitamente, sem nenhuma taxa de transação (sem uso de _gas_).

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // Variável de estado para armazenar um número
    uint public num;

    // Você precisa enviar uma transação para escrever um valor em uma variável de estado.
    function set(uint _num) public {
        num = _num;
    }

    // Você pode ler de uma variável de estado sem precisar enviar uma transação (`view`).
    function get() public view returns (uint) {
        return num;
    }
}
```