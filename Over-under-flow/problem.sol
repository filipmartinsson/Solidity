pragma solidity ^0.4.20;

contract C {

    // (2**256 - 1) + 1 = 0
    function overflow() constant returns (uint256 _overflow) {
        uint256 max = 2**256 -1;
        return max + 1;
    }

    // 0 - 1 = 2**256 - 1
    function underflow() constant returns (uint256 _underflow) {
        uint256 min = 0;
        return min - 1;
    }
}
