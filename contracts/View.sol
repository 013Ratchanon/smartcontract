// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EasyBank {
    mapping (address => uint256) balances;

    function getBalance()public view returns (uint256){
        return balances[msg.sender];
    }
}