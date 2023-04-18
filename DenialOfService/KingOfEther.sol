//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;

contract KingOfEther {
    uint public balance;
    address public king;

    function claimThrone() public payable {
        require(msg.value > balance, "less balance to claim");
        (bool success, ) = king.call{value: balance}("");
        require(success, "Failed");

        balance = msg.value;
        king = msg.sender;
    }
}
