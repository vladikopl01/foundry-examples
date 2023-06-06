// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/NFT.sol";

contract NFTTest is Test {
    NFT public nft;
    address bob = makeAddr("bob");

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    function setUp() public {
        nft = new NFT();
    }

    function testDeploy() public {
        assertEq(nft.owner(), address(this));
        assertEq(nft.name(), "NFT");
        assertEq(nft.symbol(), "NFT");
    }

    function testSafeMint() public {
        assertEq(nft.balanceOf(bob), 0);
        vm.startPrank(bob);

        vm.expectEmit(true, true, true, false);
        emit Transfer(address(0), bob, 0);

        nft.safeMint();
        vm.stopPrank();
        assertEq(nft.balanceOf(bob), 1);
    }

    function testSafeMintRequire() public {
        vm.startPrank(bob);
        vm.expectEmit(true, true, true, false);

        for (uint256 i = 0; i < 10; i++) {
            emit Transfer(address(0), bob, i);
            nft.safeMint();
        }

        vm.expectRevert("NFT: You can only mint 10 NFTs");
        nft.safeMint();
        vm.stopPrank();

        assertEq(nft.balanceOf(bob), 10);
    }
}
