// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReceiveEther {
    /*
    Qual função foi chamada, fallback() ou receive()?

           envia Ether
               |
         msg.data está vazio?
              / \
            sim  não
            /     \
receive() existe?  fallback()
         /   \
        sim   não
        /      \
    receive()   fallback()
    */

    // Função para receber ether. msg.data deve ser vazio.
    receive() external payable {}

    // Função fallback é chamada quando msg.data não é vazio.
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // Retorna erro e reverte em caso de erro.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Retorna um bool sem reverter o estado.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call retorna um bool.
        // É o método mais recomendado.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}