// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {FirstNFT} from "../src/FirstNFT.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract FirstNFTTest is Test {
    FirstNFT internal nft;

    address internal owner = address(0xABCD);
    address internal other = address(0xBEEF);

    function setUp() public {
        vm.prank(owner);
        nft = new FirstNFT("ipfs://initial-uri");
    }

    function test_constructor_revertsOnEmptyInitialURI() public {
        vm.expectRevert("initialURI required");
        vm.prank(owner);
        new FirstNFT("");
    }

    function test_constructor_mintsToken0ToOwner() public {
        assertEq(nft.ownerOf(0), owner);
        assertEq(nft.tokenURI(0), "ipfs://initial-uri");
    }

    function test_createNft_onlyOwner() public {
        vm.prank(other);
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, other));
        nft.createNft("ipfs://token-1");
    }

    function test_createNft_revertsOnEmptyTokenURI() public {
        vm.expectRevert("tokenURI required");
        vm.prank(owner);
        nft.createNft("");
    }

    function test_createNft_mintsAndSetsTokenURI() public {
        vm.prank(owner);
        uint256 id = nft.createNft("ipfs://token-1");

        assertEq(id, 1);
        assertEq(nft.ownerOf(id), owner);
        assertEq(nft.tokenURI(id), "ipfs://token-1");
    }
}
