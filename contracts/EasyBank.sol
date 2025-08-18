// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract EasyBank{
 mapping(address => uint256)  balances;

    function getBalances() public view returns(uint256){
        return balances[msg.sender];
    }
    function deposit() public payable {
    balances[msg.sender] += msg.value;

    }
     function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdraw failed!!");
    }
}
