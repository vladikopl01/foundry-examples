// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ETHReceiver.sol";

contract ETHReceiveTest is Test {
    ETHReceiver public receiver;

    function setUp() public {
        receiver = new ETHReceiver();
    }

    function _send(uint256 amount) private {
        (bool success,) = address(receiver).call{value: amount}("");
        require(success, "ETH transfer failed");
    }

    function testEthBalance() public view {
        console.log("ETH balance", address(this).balance / 1e18);
    }

    function testSendETH() public {
        uint256 balanceBefore = address(receiver).balance;

        // deal(address, uint) - Set balance of the address
        deal(address(1), 100);
        assertEq(address(1).balance, 100);

        deal(address(1), 10); // SETS BALANCE TO X, NOT INCREASES BY X
        assertEq(address(1).balance, 10);

        // hoax(address, uint) - deal() + prank()
        deal(address(1), 123);
        vm.prank(address(1));
        _send(123);

        hoax(address(1), 456);
        _send(456);

        assertEq(address(receiver).balance, balanceBefore + 123 + 456);
    }
}
