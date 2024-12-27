// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet {
    address public owner;
    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withDraw() public {
        require(owner == msg.sender, "You are not the owner");
        payable(msg.sender).transfer(address(this).balance);
    }
}

