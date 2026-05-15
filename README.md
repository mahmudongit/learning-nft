# NFTs

A simple NFT project built with Solidity and Foundry. Deployed and verified on Etherscan

This repository contains two ERC-721 NFT smart contracts:

- `FirstNFT` → A basic NFT contract with custom metadata support.
- `MoodNFT` → A dynamic NFT that changes mood between happy and sad.

The project was built mainly for learning and practicing NFT development using OpenZeppelin contracts and Foundry.

---

# Tech Stack

- Solidity `^0.8.20`
- Foundry
- OpenZeppelin Contracts
- ERC-721 Standard

---

# Project Structure

```txt
NFTs/
│
├── src/                    # Smart contracts
│   ├── FirstNFT.sol
│   └── MoodNFT.sol
│
├── script/                 # Deployment scripts
│   ├── Deploy.s.sol
│   ├── DeployMoodNFT.s.sol
│   └── Interactions.s.sol
│
├── test/                   # Unit and integration tests
│   ├── FirstNFT.t.sol
│   ├── MoodNFTTest.t.sol
│   └── DeployMoodNFTTest.t.sol
│
├── img/                    # SVG images used by MoodNFT
│   ├── happy.svg
│   ├── sad.svg
│   └── Vane.png
│
├── metadata.json
├── Makefile
└── README.md
