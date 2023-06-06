// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/FuzzMath.sol";

contract FuzzTest is Test {
    FuzzMath public math;

    function setUp() public {
        math = new FuzzMath();
    }

    function test_Add() public {
        assertEq(math.add(1, 2), 3);
    }

    function testFuzz_Add(uint256 a, uint256 b) public {
        // Overflow check
        unchecked {
            // Assumes state is true, otherwise test will discard
            vm.assume(a + b >= a);
        }

        uint256 res = math.add(a, b);
        assertEq(res, a + b);
    }

    function testFuzz_AddBounds(uint256 a, uint256 b) public {
        // Bounds value to min and max values
        a = bound(a, 0, 100);
        b = bound(b, 0, 100);

        uint256 res = math.add(a, b);
        assertEq(res, a + b);
    }
}
