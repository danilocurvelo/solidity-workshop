# Import

Você pode importar arquivos locais e externos em Solidity.

## Local

Foo.sol
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    string public name = "Foo";
}
```

Import.sol
```solidity
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
```

## Externo

Você pode importar do Github simplesmente copiando a URL.

```solidity
// https://github.com/owner/repo/blob/branch/path/to/Contract.sol
import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// Exemplo de importar ECDSA.sol do repositório openzeppelin-contract, branch release-v4.5
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";
```