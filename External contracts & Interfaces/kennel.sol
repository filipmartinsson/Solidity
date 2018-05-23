pragma solidity^0.4.0;

import './DogContract.sol';

contract BankInterface{
    function getBalance() view returns (uint);
    function deposit() payable;
}

contract Kennel is DogContract {

    modifier costs(uint value){
        require(msg.value >= value);
        _;
    }

    address externalAddress = "*ADDRESS_OF_BANK_CONTRACT*"
    BankInterface BankContract = BankInterface(externalAddress);


    function transferDog(address _newOwner) payable costs(100) {
        address owner = msg.sender;
        require(owner != _newOwner);
        uint dogId = ownerToDog[owner];
        delete(ownerToDog[owner]);
        ownerToDog[_newOwner] = dogId;
        assert(ownerToDog[owner] == 0);
        BankContract.deposit.value(msg.value)();
    }

    function getBankBalance() view returns (uint){
        return BankContract.getBalance();
    }

    function addKennelDog(string _name, uint _age) {
        addDog(_name, _age);
    }

}
