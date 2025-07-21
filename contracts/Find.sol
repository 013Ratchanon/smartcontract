// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract FindMinMaxValue {
    uint public maxValue_uint = type(uint).max;
    uint8 public maxValue_uint8 = type(uint8).max;
    uint8 public minValue_uint8 = type(uint8).min;
    uint16 public maxValue_uint16 = type(uint16).max;
    uint16 public minValue_uint16 = type(uint16).min;
    uint32 public maxValue_uint32 = type(uint32).max;
    uint32 public minValue_uint32 = type(uint32).min;
    uint256 public maxValue_uint256 = type(uint256).max;
    uint256 public minValue_uint256 = type(uint256).min;
}