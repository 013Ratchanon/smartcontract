// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UdsaneeTokens is ERC20 {
    address owner;
    mapping(address => uint256)  balances;
     uint unitsOneTokenToBuy = 10;
     event Buy(address indexed from, address indexed to, uint tokens);
    
    constructor() ERC20("UdsaneeTokens", "UDS") {
        owner = msg.sender;
        _mint(address(this), 1000000 * 10 **decimals());
    }
    modifier onlyOwner() {
         require(msg.sender == owner, "Only owner can call this function");
        _;
    }
      function buy() public payable  {
         require(msg.value > 0 wei, "Insufficient balance");
         uint amount = msg.value * unitsOneTokenToBuy;
         require(amount > 0, "Too less amount of token");

         require(balanceOf(address(this)) >= amount, "There is no token left. Sold out!!");
         _transfer(address(this), msg.sender, amount);
         emit Buy(address(this), msg.sender, amount);
      }


      function withdraw(uint256 amount) onlyOwner public {
        require(balanceOf(address(this)) > amount, "Insufficient balance");
        _transfer(address(this), msg.sender, amount);
        balances[msg.sender];
    }
}