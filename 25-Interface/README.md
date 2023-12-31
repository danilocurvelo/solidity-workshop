# Interface

Você pode interagir com outros contratos declarando uma `Interface`.

Interface:

- não pode ter nenhuma função implementada
- pode herdar de outras interfaces
- todas as funções declaradas devem ser `external`
- não é possível declarar um construtor
- não é possível declarar variáveis de estado

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface InterfaceExample {
 
    function getStr() external pure returns (string memory);
 
    function setValue(uint _num1, uint _num2) external;
 
    function add() external view returns (uint);

}

contract MyContract is InterfaceExample {

	uint private num1;
	uint private num2;

	function getStr() public pure override returns (string memory) {
		return "Blockchain";
	}

	function setValue(uint _num1, uint _num2) public override {			 
		num1 = _num1;
		num2 = _num2;
	}

	function add() public view override returns (uint) {
		return num1 + num2;
	}
}

contract call {
	
	InterfaceExample obj;

	constructor() {
		obj = new MyContract();
	}
	
	function getValue() public returns (string memory, uint) {
		obj.setValue(10, 16);
		return (obj.getStr(), obj.add());
	}

}
```

## Para fazer uso de outros contratos

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);

    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}

// Exemplo Uniswap
interface UniswapV2Factory {
    function getPair(
        address tokenA,
        address tokenB
    ) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}
```