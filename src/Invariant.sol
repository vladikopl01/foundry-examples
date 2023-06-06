// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

contract Invariant {
    bool public flag;

    function func1() public {}
    function func2() public {}
    function func3() public {}
    function func4() public {}

    function func5() public {
        flag = true;
    }
}
