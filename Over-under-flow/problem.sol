pragma solidity 0.5.1;

contract C {

    // (2**256 - 1) + 1 = 0
    function overflow() public pure returns (uint256 _overflow) {
        uint256 max = 2**256 -1;
        return max + 1;
    }

    // 0 - 1 = 2**256 - 1
    function underflow() public pure returns (uint256 _underflow) {
        uint256 min = 0;
        return min - 1;
    }
}
