pragma solidity ^0.4.0;

contract BankContract{
    uint balance;
    
    function deposit() payable {
        balance += msg.value;
    }
    function getBalance() view returns (uint){
        return balance;
    }
}