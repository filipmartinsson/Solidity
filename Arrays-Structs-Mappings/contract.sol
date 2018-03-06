pragma solidity^0.4.0;

contract DogContract{
    
    struct Dog {
        string name;
        uint age;
    }
    
    Dog[] dogs;
    mapping(address => uint) ownerToDog;
    
    function addDog(string _name, uint _age){
        address owner = msg.sender;
        uint id = dogs.push(Dog(_name, _age));
        ownerToDog[owner] = id;
    }
    
    function getDog() returns (string){
        address owner = msg.sender;
        uint id = ownerToDog[owner];
        return dogs[id-1].name;
    }
}