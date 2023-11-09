# Selfdestruct

Os contratos podem ser excluídos do blockchain chamando `selfdestruct`.

A autodestruição envia todo o Ether restante armazenado no contrato para um endereço designado.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract MyContract {
    address payable owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function kill() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}
```