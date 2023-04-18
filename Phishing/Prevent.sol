// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Phishing {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value != 0, "value =0");
    }

    function transfer(address payable _to, uint amount) public {
        require(msg.sender == owner, "not owner");
        (bool success, ) = _to.call{value: amount}("");
        require(success, "failed");
    }

    function getAccountBalance() public view returns (uint) {
        return address(this).balance;
    }
}
