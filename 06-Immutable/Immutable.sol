// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Immutable {
    // convenção de nomes de constantes
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}