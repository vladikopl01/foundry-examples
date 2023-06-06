// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract SignatureTest is Test {
    function testSignature() public {
        uint256 privateKey = 123;
        address publicKey = vm.addr(privateKey);

        bytes32 message = keccak256("Secret message");

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, message);
        address signer = ecrecover(message, v, r, s);

        assertEq(signer, publicKey);
    }
}
