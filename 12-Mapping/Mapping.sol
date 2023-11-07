// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mapping {
    // Mapping de address para uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // Mapping sempre retorna um valor.
        // Se o valor nunca foi definido, será retornado o valor padrão (default).
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Atualiza o valor neste endereço
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reseta o valor armazenado para o padrão.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Mapping aninhado (mapping de address para outro mapping)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}