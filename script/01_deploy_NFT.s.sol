// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/NFT.sol";

// Run this script with to deploy the NFT contract on Goerli:
// forge script script/01_deploy_NFT.s.sol --rpc-url $GOERLI_RPC_URL --broadcast --verify -vvvv

// Run this script with to deploy the NFT contract on localhost:
// forge script script/01_deploy_NFT.s.sol --fork-url http://localhost:8545 --broadcast -vvvv

contract DeployNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        NFT nft = new NFT();

        vm.stopBroadcast();
    }
}
