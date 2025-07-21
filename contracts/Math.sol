// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MathOperation {
    uint8 public balance;

    function decrease() public {
        balance--;
    }

    function increase() public {
        balance++;
    }

}