// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        // How Foundry need to check next event
        vm.expectEmit(true, true, false, true);

        // Emit expected event
        emit Transfer(address(this), address(123), 100);

        // Call the function which emits the event
        e.transfer(address(this), address(123), 100);

        // Check only forst indexed argument
        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(123), 100);
        e.transfer(address(this), address(456), 999);
    }

    function testEmitManyTransferEvent() public {
        // Creating array of addresses
        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        // Creating array of values
        uint256[] memory value = new uint256[](2);
        value[0] = 100;
        value[1] = 200;

        for (uint256 i = 0; i < to.length; i++) {
            // How Foundry need to check next event
            vm.expectEmit(true, true, false, true);

            // Emit expected event
            emit Transfer(address(this), to[i], value[i]);
        }

        // Call the function which emits the event
        e.transferMany(address(this), to, value);
    }
}
