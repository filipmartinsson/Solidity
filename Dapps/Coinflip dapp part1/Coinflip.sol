pragma solidity ^0.4.17;

contract Coinflip {
  address owner;

  function Coinflip() public{
    owner = msg.sender;
  }

  function getBalance() constant public returns (uint){
    return this.balance;
  }

  function flip() payable public{
    uint time = block.timestamp;
    uint bet = msg.value;

    if(time % 2 == 0){
      msg.sender.transfer(bet*2);
    }
  }
}
