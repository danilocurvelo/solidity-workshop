// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// import Foo.sol do diretório atual
import "./Foo.sol";

// import {symbol1 as alias, symbol2} de "filename";
import {Unauthorized, add as func, Point} from "./Foo.sol";

contract Import {
    // Inicializa Foo.sol
    Foo public foo = new Foo();

    // Testando Foo.sol pega a variável de estado name.
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}