// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "node_modules/@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract SecureVault is ReentrancyGuard {

    mapping (address => uint256) balance;

    function deposit() external payable {
        require(msg.value > 0 , "Must send ETH");
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external nonReentrant {
        require( amount <= balance[msg.sender] , "Insufficient balance");

        balance[msg.sender] -= amount;
        (bool success , ) = msg.sender.call{value : amount}("");
        require(success , "Transfer failed");
    }

}