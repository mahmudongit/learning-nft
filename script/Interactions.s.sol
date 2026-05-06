// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {FirstNFT} from "../src/FirstNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintFirstNFT is Script {

    string public constant TOKENURI = "ipfs://bafkreibvkt7p2az2fikq7hiqcmtbv4ptbjydqtzaymw75xb2gspw6mh55u";


    function run() external {
        address MostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FirstNFT", block.chainid);

        mintNftOnContract(MostRecentlyDeployed);
        }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        FirstNFT(contractAddress).createNft(TOKENURI);
        vm.stopBroadcast(); 
        }
    
}
