pragma solidity ^0.4.17;

contract HelloWorld {
  string public message;

  function HelloWorld(string message2) public{
    message = message2;
  }

  function update(string message2) public {
    message = message2;
  }
}
