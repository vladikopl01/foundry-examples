// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/FuzzMath.sol";

contract FuzzTest is Test {
    FuzzMath public math;

    function setUp() public {
        math = new FuzzMath();
    }

    function testAddManual() public {
        assertEq(math.add(1, 2), 3);
    }

    function testAddFuzz(uint256 a, uint256 b) public {
        if (a + b < a) vm.expectRevert(); // overflow

        uint256 res = math.add(a, b);
        assertEq(res, a + b);
    }
}
