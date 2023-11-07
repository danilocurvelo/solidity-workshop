// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Enum {
    // Enum representando o status de um pedido online
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Valor padrão é o primeiro elemento listado na
    // definição do tipo, neste caso "Pending"
    Status public status;

    // Retorna uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Atualiza o status passando o uint como entrada
    function set(Status _status) public {
        status = _status;
    }

    // Você pode atualizar para um valor específico
    function cancel() public {
        status = Status.Canceled;
    }

    // delete reseta o enum para seu valor padrão, 0
    function reset() public {
        delete status;
    }
}