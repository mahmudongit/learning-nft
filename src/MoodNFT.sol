// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

error MoodNFT__CantFlipMoodIfNotOwner();

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_happySvgImageUri;
    string private s_sadSvgImageUri;

    enum Mood { HAPPY, SAD }
    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory happySvg, string memory sadSvg) ERC721("MoodNFT", "MNFT") {
        s_tokenCounter = 0;
        s_happySvgImageUri = happySvg;
        s_sadSvgImageUri = sadSvg;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.SAD;
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI = (s_tokenIdToMood[tokenId] == Mood.SAD) 
            ? s_sadSvgImageUri 
            : s_happySvgImageUri;

        // FIXED: Cleaned up quotes, added missing brackets and commas for valid JSON
        string memory tokenMetadata = string.concat(
            '{"name":"', name(), '", ',
            '"description":"An NFT that changes to the mood of its owner", ',
            '"attributes":[{"trait_type":"mood", "value":"', 
            (s_tokenIdToMood[tokenId] == Mood.SAD ? "sad" : "happy"), 
            '"}], ',
            '"image":"', imageURI, '"}'
        );

        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(bytes(tokenMetadata))
            )
        );
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function flipMoodNft(uint256 tokenId) public {
        // Use the custom error for gas efficiency
        if (getApproved(tokenId) != msg.sender && ownerOf(tokenId) != msg.sender) {
            revert MoodNFT__CantFlipMoodIfNotOwner();
        }

        s_tokenIdToMood[tokenId] = (s_tokenIdToMood[tokenId] == Mood.SAD) 
            ? Mood.HAPPY 
            : Mood.SAD;
    }
}
