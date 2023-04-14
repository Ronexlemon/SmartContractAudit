//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;

 contract Set{
     address public owner;

    function pwn()public{
        owner = msg.sender;

    }
}
