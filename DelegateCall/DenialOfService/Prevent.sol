//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;

contract KingOfEther {
    uint public balance;
    address public king;
    mapping(address => uint) public balances;

    function claimThrone() public payable {
        require(msg.value > balance, "less balance to claim");
        //  (bool success,) = king.call{value: balance}("");
        //  require(success,"Failed");

        balance = msg.value;

        king = msg.sender;
        balances[king] += balance;
    }

    function withdraw() public {
        require(msg.sender != king, "king cannot withdraw");
        balances[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Failed");
    }
}
