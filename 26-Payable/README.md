# Payable

Funções e endereços declarados como `payable` podem receber `ether` para o contrato.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Payable {
    // payable address pode enviar ether através de transfer ou send
    address payable public owner;

    // construtor payable pode recever ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // Função para depositar ether no contrato 
    // Chame essa função junto com algum ether 
    // O saldo deste contrato irá automaticamente ser atualizado.
    function deposit() public payable {}

    // Chame essa função junto com algum ether 
    // A função irá levantar um erro já que essa função não é payable.
    function notPayable() public {}

    // FUnção para sacar todo o ether do contrato.
    function withdraw() public {
        // obtém o total de ether armazenado neste contrato.
        uint amount = address(this).balance;

        // enviar todo o ether para o dono do contrato (owner)
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Função para transferir ether deste contrato para um endereço (address) da entrada
    function transfer(address payable _to, uint _amount) public {
        // Note que "to" é declarada como payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}
```