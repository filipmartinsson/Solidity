pragma solidity ^0.4.17;

contract Coinflip {
  address owner;
  mapping(address => bool) lastFlip;

  function Coinflip() public{
    owner = msg.sender;
  }

  function getBalance() constant public returns (uint){
    return address(this).balance;
  }

  function getLastFlip(address player) constant public returns (bool){
    return lastFlip[player];
  }

  function flip() payable public{
    uint time = block.timestamp;
    uint bet = msg.value;

    if(time % 2 == 0){
      msg.sender.transfer(bet*2);
      lastFlip[msg.sender] = true;
    }
    else{
      lastFlip[msg.sender] = false;
    }
  }

  function deposit() payable public {

  }
}
