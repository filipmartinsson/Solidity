pragma solidity^0.4.0;

import './DogContract.sol';

contract Kennel is DogContract {

    modifier costs(uint value){
        require(msg.value >= value);
        _;
    }

    function transferDog(address _newOwner) payable costs(100) {
        address owner = msg.sender;
        require(owner != _newOwner);
        uint dogId = ownerToDog[owner];
        delete(ownerToDog[owner]);
        ownerToDog[_newOwner] = dogId;
        assert(ownerToDog[owner] == 0);
    }

    function addKennelDog(string _name, uint _age) {
        addDog(_name, _age);
    }

}
