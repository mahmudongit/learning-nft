// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/FirstNFT.sol";

contract DeployFirstNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        new FirstNFT("ipfs://bafkreibvkt7p2az2fikq7hiqcmtbv4ptbjydqtzaymw75xb2gspw6mh55u");

        vm.stopBroadcast();
    }
}
