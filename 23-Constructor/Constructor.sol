// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Contrato base X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Contrato base Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Existem duas formas de inicializar um contrato pai com parâmetros.

// Passar os parâmetros na lista de herança. 
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
    // Passar os parâmetros no construtor, 
    // similar a funções modificadoras
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Construtores pai sempre são chamados na ordem de herança
// independente da ordem dos contratos pai listados no
// construtor do contrato filho.

// Ordem de chamada dos construtores:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Ordem de chamada dos construtores:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}