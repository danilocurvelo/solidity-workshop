// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Primitives {
    bool public boo = true;

    /*
    uint significa unsigned integer, ou seja, inteiros não negativos
    diferentes comprimentos estão disponíveis
        uint8   intervalo de 0 a 2 ** 8 - 1
        uint16  intervalo de 0 a 2 ** 16 - 1
        ...
        uint256 intervalo de 0 a 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint é uma alias para uint256

    /*
    Números negativos são possíveis nos tipos int
    Como uint, diferentes intervalos são disponíveis de int8 a int256
    
    int256 intervalo de -2 ** 255 a 2 ** 255 - 1
    int128 intervalo de -2 ** 127 a 2 ** 127 - 1
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int é o mesmo que int256

    // minimo e maximo de um int
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    Em Solidity, o tipo de dado byte representa uma sequência de bytes.
    Solidity tem dois tipos de bytes:

     - array de bytes de tamanho fixo
     - array de bytes de tamanho dinâmico
     
    O termo bytes em Solidity representa o array dinâmico. 
    É o mesmo que byte[]

    Para array de tamanho fixo, usar (bytes1, bytes2, bytes3, ..., bytes32)
    */
    bytes dynamicData; 

    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    string data = "solidity"; // string é um array de bytes dinâmico

    // Valores padrões (default)
    // Variáveis não definidas tem um valor default:
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
