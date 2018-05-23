pragma solidity ^0.4.24;

//Decide where to use require and where to use assert and practice what to check.

contract Group{

    /*
    *   Add numbers between 0 and 10
    */
    function addSmallNumbers(uint _num1, uint _num2) view returns (uint){
        require(_num1 >= 0 && _num2 >= 0 && _num1 <= 10 && _num2 <= 10);
        uint toReturn = _num1 + _num2;
        assert (toReturn == (_num1 + _num2) && toReturn >= 0 && toReturn <= 20);
        return toReturn;
    }

}
