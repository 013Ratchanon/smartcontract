// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ComplicatedBank{
 mapping(address => uint256)  balances;
    address[] accounts;
    uint256 interestRate = 3;
    address public owner;
   
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
   function getSystemBalance() public view onlyOwner returns(uint256) {
    return address(this).balance;
   }
    function calculateInterest(address _account) public view onlyOwner returns (uint) {
        uint256 interests = balances[_account] * interestRate / 100;
        return interests;
    }
   
   function totalInterestPerYear()public view onlyOwner returns(uint) {
     
     uint total;
     for (uint256 i=0; i<accounts.length; i++){


       total += calculateInterest(accounts[i]);
    }
    return total;
   }

   
    function getBalances() public view returns(uint256){
        return balances[msg.sender];
    }
    function deposit() public payable {
    balances[msg.sender] += msg.value;
    accounts.push(msg.sender);

    }
     function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdraw failed!!");
    }
}
