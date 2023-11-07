# Visibilidade

Funções e variáveis de estado devem declarar se são acessíveis por outros contratos.

Funções podem ser declaradas como:

- `public` - podem ser acessadas/chamadas por qualquer contrato e conta
- `private` - podem ser acessadas/chamadas somente dentro do contrato que define a função
- `internal` - podem ser acessadas/chamadas somente dentro do contrato ou por contratos que herdam essa função
- `external` - podem ser chamadas apenas por outros contratos e contas

Variáveis de estado podem ser declaradas como públicas, privadas ou internas, mas não externas.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Base {
    // Função private só pode ser chamada
    // de dentro do contrato
    // Contratos que herdam esse contrato não podem chamar essa função.
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Função internal pode ser chamada
    // - de dentro do contrato
    // - de dentro de contratos que herdam esse contrato
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Função public pode ser chamada
    // - de dentro do contrato
    // - de dentro de contratos que herdam esse contrato
    // - po outros contratos e contas
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // Função external só pode ser chamada
    // por outros contratos e contas
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // Essa função não irá compilar pois estamos tentando chamar 
    // uma função external.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // Vairáveis de estado
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // Variáveis de estado não pode ser external (nào compila).
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // Contratos herdados não tem acesso a funções private
    // e variáveis de estado.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Função internal pode ser chamada de contratos-filho.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
```