pragma solidity ^0.4.0;

contract Person{
    string name;
    uint age;

    function getName() view returns (string) {
        return name;
    }

    function getAge() view returns(uint){
        return age;
    }
    function setName(string _name){
        name = _name;
    }

    function setAge(uint _age){
        age = _age;
    }
}
