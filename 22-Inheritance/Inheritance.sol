// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* Grafo de herança
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contrato herda outros contratos utilizado a palavra reservada 'is'.
contract B is A {
    // Sobrescreve A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Sobrescreve A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contratos podem herdar de múltiplos contratos-pai.
// Quando uma função é chamada que é definida múltiplas vezes em 
// diferentes contratos, os contratos-pai são analisados da direita
// para a esquerda, e em profundidade primeiro.

contract D is B, C {
    // D.foo() retorna "C"
    // já que C é o contrato-pai mais a direita com a função foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() retorna "B"
    // já que B é o contrato-pai mais a direita com a função foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}