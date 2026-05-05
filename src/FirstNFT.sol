// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract FirstNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

constructor(string memory initialURI) ERC721("FirstNFT", "FNFT") Ownable(msg.sender) {
        require(bytes(initialURI).length != 0, "initialURI required");

        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, initialURI);
    }

    function createNft(string memory tokenURI) public onlyOwner returns (uint256) {
        require(bytes(tokenURI).length != 0, "tokenURI required");

        uint256 newItemId = _nextTokenId++;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
