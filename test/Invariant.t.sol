// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Invariant.sol";

contract InvariantTest is Test {
    Invariant public inv;

    function setUp() public {
        inv = new Invariant();
    }

    function invariant_FlagIsAlwaysFalse() public {
        assertEq(inv.flag(), false);
    }
}
