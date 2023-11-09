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
