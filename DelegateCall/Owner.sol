//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;
interface Set{
    function pwn()external;
}
contract SetOwner{
    address public owner;
     Set _set;
    constructor(address set){
        owner = msg.sender;
        _set = Set(set);
    }
    fallback()external payable{
        address(_set).delegatecall(msg.data);
    }
    receive()external payable{}
}
