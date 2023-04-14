//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;

contract LotteryGame{
    uint public constant targetAmount = 7 ether;
    address public winner;

    function deposit()public payable{
        require(msg.value == 1 ether,"need exactly one ether");
        uint balances = address(this).balance;
        require(balances <= targetAmount,"Game Over");
        if(balances == targetAmount ){
            winner = msg.sender;
        }
    }
    function claimReward()public {
        require(winner == msg.sender,"not the winner");
        (bool success,) = msg.sender.call{value:address(this).balance}("");
        require(success,"Failed");
    }

    function getAccountBalance()public view returns (uint){
        return address(this).balance;
    }
}

