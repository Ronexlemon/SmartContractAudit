//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;
contract GuessTheRandomNumber {
    constructor() payable {}

    function guess(uint _guess) public returns (bool) {
        uint answer = uint(
            keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
        );
        

        if (_guess == answer) {
            (bool sent, ) = msg.sender.call{value: 1 ether}("");
            require(sent, "Failed to send Ether");
        }
return(false);
    }
    function getAnswer()public view returns(uint){
        uint answer = uint(
            keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
        );
        return  answer;
    }
}

