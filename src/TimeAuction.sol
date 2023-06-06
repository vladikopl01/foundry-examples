// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

contract TimeAuction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() public view {
        require(block.timestamp >= startAt, "Auction not started yet");
        require(block.timestamp < endAt, "Auction ended");
    }

    function end() public view {
        require(block.timestamp >= endAt, "Auction can not be ended yet");
    }
}
