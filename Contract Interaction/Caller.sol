pragma solidity ^0.4.0;

contract Caller {
    function getCalleeValue(address addr) returns (uint){
        Callee c = Callee(addr);
        return c.getValue();
    }
    function setCalleValue(address addr, uint newValue) returns (uint){
        Callee c = Callee(addr);
        c.setValue(newValue);
        return c.getValue();
    }
}

contract Callee {
    function getValue() returns(uint);
    function setValue(uint value);
}