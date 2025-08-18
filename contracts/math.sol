// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SolidityTest{
    uint public  a = 5;//State variable
    uint public b = 10;
    
    function increase() view public returns(uint) {
        uint result = a+b;
        return result;
       
    }

    function decrease() view public returns(uint){
       uint result = a-b;
        return result;
    }

    function multiply() view public returns(uint){
        uint result = a*b;
        return result;
    }

    function divide() view public returns(uint) {
        uint result = a/b;
        return result;
    }

    function modules() view public returns(uint){
        uint result = a%b;
        return result;
    }

    function avge(uint x, uint y, uint z) public pure returns(uint) {
        uint sum = (x+y+z)/3;
        return sum;
    }
}
