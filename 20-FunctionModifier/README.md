# Modificadores (_modifiers_) de função

Modificadores são códigos que podem ser executados antes e/ou depois de uma chamada de função.

Os modificadores podem ser usados para:

- Restringir acesso (controle de acesso)
- Validar entradas
- Proteção contra hack de reentrada

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionModifier {
    // Vamos usar essas variáveis para demonstrar como utilizar
    // modificadores.
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Define o remetente da transação como o dono do contrato.
        owner = msg.sender;
    }

    // Modificador para verificar se quem está chamando a função é o dono
    // do contrato.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // O underscore (_) é um caractere especial usado somente dentro
        // de um modificador e informa o Solidity para executar o resto  
        // da função modificada.
        _;
    }

    // Modificadores podem receber entradas. Esse modificador checa se
    // o endereço passado não é um endereço nulo (0x0)
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modificadores podem ser chamados antes e/ou depois de uma função.
    // Esse modificador previne que uma função seja chamada enquanto 
    // ainda estiver em execução.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
```