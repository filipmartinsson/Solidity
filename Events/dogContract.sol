pragma solidity^0.4.0;

contract DogContract{

    struct Dog {
        string name;
        uint age;
    }

    Dog[] dogs;
    mapping(address => uint) ownerToDog;

    event addedDog(address owner, string name, uint dogId);

    function addDog(string _name, uint _age) internal {
        address owner = msg.sender;
        uint id = dogs.push(Dog(_name, _age));
        ownerToDog[owner] = id;
        addedDog(owner, _name, id);
    }

    function getDog() returns (string) {
        address owner = msg.sender;
        uint id = ownerToDog[owner];
        return dogs[id-1].name;
    }


}
