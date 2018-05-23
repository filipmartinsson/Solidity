pragma solidity ^0.4.0;

contract Group{
    Person[] ages;

    struct Person{
        string name;
        uint age;
    }

    function addPerson(string _name, uint _age) {
        ages.push(Person(_name, _age));
    }

    function getAvarageAge() view returns (uint){
        uint total;
        for (uint i=0; i < ages.length; i++) {
            total += ages[i].age;
        }
        return total/ages.length;
    }
    
}
