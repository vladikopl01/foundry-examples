// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/TimeAuction.sol";

contract TimeAuctionTest is Test {
    TimeAuction public auction;
    uint256 private startAt;

    function setUp() public {
        auction = new TimeAuction();
        startAt = block.timestamp;
    }

    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("Auction not started yet"));
        auction.bid();
    }

    function testBidFailsAfterEndTime() public {
        vm.expectRevert(bytes("Auction ended"));
        // vm.warp() - set block.timestamp to a future timestamp
        vm.warp(startAt + 2 days);
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testTimestamp() public {
        uint256 t = block.timestamp;

        // skip() - increment current timestamp
        skip(100);
        assertEq(block.timestamp, t + 100);

        // rewind() - decrement current timestamp
        rewind(10);
        assertEq(block.timestamp, t + 100 - 10);
    }

    function testBlockNumber() public {
        // vm.roll() - set block.number
        vm.roll(999);
        assertEq(block.number, 999);
    }
}
