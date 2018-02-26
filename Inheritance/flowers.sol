pragma solidity ^0.4.16;

contract Flower {
    address owner;
    string flowerType;

    function Flower(string newFlowerType) { 
        owner = msg.sender; 
        flowerType = newFlowerType;
    }
    
    function water() constant returns (string){
        return "Thanks, I love water!";
    }
    
}

contract Rose is Flower("Rose") {

    function pick() constant returns (string){
        return "Ouch";
    }
}

contract Jasmine is Flower("Jasmine") {
    function smell() constant returns (string){
        return "Mmmmmm";
    }
}

