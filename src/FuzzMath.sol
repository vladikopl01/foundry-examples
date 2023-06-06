// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

contract FuzzMath {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}
