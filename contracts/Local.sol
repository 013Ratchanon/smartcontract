//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract SolidityTest{
    uint storedData;//State variable
    constructor(){
        storedData = 10;
    }
    function getResult() public pure  returns(uint){
        uint a = 1;//local variable
        uint b = 2;
        uint result = a + b ;
        return  result; //access the local variable
    }
}

