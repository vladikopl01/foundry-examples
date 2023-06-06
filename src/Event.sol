// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

contract Event {
    event Transfer(address indexed from, address indexed to, uint256 value);

    function transfer(address from, address to, uint256 value) public {
        emit Transfer(from, to, value);
    }

    function transferMany(address from, address[] calldata to, uint256[] calldata value) public {
        for (uint256 i = 0; i < to.length; i++) {
            emit Transfer(from, to[i], value[i]);
        }
    }
}
