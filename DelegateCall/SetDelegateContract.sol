//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;

 contract Lib {
    uint public someNumber;

    function doSomething(uint _num) public {
        someNumber = _num;
    }
}
