// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "solmate/tokens/WETH.sol";

contract InvariantWETHTest is Test {
    WETH public weth;

    function setUp() public {
        weth = new WETH();
    }

    function invariant_BalanceIsAlwaysZero() public {
        assertEq(weth.balanceOf(address(this)), 0);
    }
}
