pragma solidity ^0.4.0;

contract Callee {
    uint public value;
   
    function getValue() returns(uint) {
        return value;
    }
    
    function setValue(uint newValue) {
        value = newValue;
    }
    
}
