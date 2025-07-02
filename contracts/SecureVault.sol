// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "node_modules/@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract SecureVault is ReentrancyGuard {

    mapping (address => uint256) public balances;

    function deposit() external payable {
        require(msg.value > 0 , "Must send ETH");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external nonReentrant {
        require( amount <= balances[msg.sender] , "Insufficient balance");

        balances[msg.sender] -= amount;
        (bool success , ) = msg.sender.call{value : amount}("");
        require(success , "Transfer failed");
    }

}