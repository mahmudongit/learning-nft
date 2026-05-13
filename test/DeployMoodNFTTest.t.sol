//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {DeployMoodNFT} from "script/DeployMoodNFT.s.sol";
import {Test} from "forge-std/Test.sol";

contract DeployMoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public{
        deployer = new DeployMoodNFT();
    }

    function testConvertSvgToUri() public view {
    // Corrected base64 string without the injected newline character
    string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIyMDAiIHk9IjI1MCIgZmlsbD0iYmxhY2siPkFsaGFtZHVsaWxsYWggPC90ZXh0Pjwvc3ZnPg==";
    
    string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="200" y="250" fill="black">Alhamdulillah </text></svg>';

    string memory actualUri = deployer.svgToImageURI(svg);

    assertEq(actualUri, expectedUri); //use assertEq for better error messages
    }


}