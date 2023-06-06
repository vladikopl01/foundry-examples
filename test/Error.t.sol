// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    // Test expected to be failed should contain `Fail` in its name
    function testFailThrowRequire() public view {
        err.throwRequire();
    }

    // Or use vm.expectRevert() if test should be reverted
    function testThrowRequire() public {
        vm.expectRevert();
        err.throwRequire();
    }

    function testThrowRequireMessage() public {
        vm.expectRevert(bytes("require thrown"));
        err.throwRequire();
    }

    function testRevertCustomError() public {
        vm.expectRevert(Error.CustomError.selector);
        err.throwCustomError();
    }
}
