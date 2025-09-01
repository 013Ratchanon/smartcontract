// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.30;

contract Lottery{
     mapping(address => uint256)  balances;
    address public manager;
    address[] public players;
    address public winnerPlayer;
    uint public winnerIndex;

    constructor() {
        manager = msg.sender;
    }

    modifier onlyplayers() {
        require(msg.sender == manager, "Only players can call this function");
        _;
    }

    function enter() public payable {
        require(msg.value >= 0.005 ether);
        players.push(msg.sender);
    }

    function pickWinner() public {
        require(msg.sender == manager);
        uint index = random() % players.length;
        winnerIndex = index;
        (bool success,) =players[index].call{value:(address(this).balance)}("");
        require(success, "Transfer failed");
        winnerPlayer = players[index];
        players = new address [](0);
    }

    function random() private view returns (uint) {
        return uint256(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }


}