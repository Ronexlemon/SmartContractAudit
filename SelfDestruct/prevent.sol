//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;
/*
use state variables for operations instead of updating balance using address(this).balance
*/
contract LotteryGame{
    uint public constant targetAmount = 7 ether;
    address public winner;
    uint balance;
    function deposit()public payable{
        require(msg.value == 1 ether,"need exactly one ether");
        uint balances = balance +1;
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
