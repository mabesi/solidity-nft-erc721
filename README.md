# Solidity NFT ERC721

**[🇧🇷 Leia em Português](README-PT.md)**

> A simple and educational implementation of an NFT smart contract following the ERC721 standard in Solidity.

## :speech_balloon: Description

This project demonstrates a complete implementation of the ERC721 Non-Fungible Token (NFT) standard in Solidity. It includes the core ERC721 functionality along with the Metadata and Enumerable extensions, providing a comprehensive example for developers learning about NFT smart contract development.

The `BasicNFT` contract implements all required interfaces and includes additional features like minting, burning, and safe transfer mechanisms, making it a solid foundation for understanding how NFTs work on the Ethereum blockchain.

## Table of Contents

- [Features](#features)
- [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Deployment](#deployment)
  - [Usage](#usage)
- [Smart Contract Details](#smart-contract-details)
  - [Contract Information](#contract-information)
  - [Key Functions](#key-functions)
  - [Supported Interfaces](#supported-interfaces)
- [Back Matter](#back-matter)
  - [Acknowledgements](#acknowledgements)
  - [Contributing](#contributing)
  - [Authors & Contributors](#authors--contributors)
  - [Legal Disclaimer](#legal-disclaimer)
  - [License](#license)

## Features

- **Full ERC721 Standard Compliance**: Implements all required functions from the ERC721 specification
- **Metadata Extension**: Supports `name()`, `symbol()`, and `tokenURI()` for rich token information
- **Enumerable Extension**: Provides `totalSupply()`, `tokenByIndex()`, and `tokenOfOwnerByIndex()` for token discovery and iteration
- **Mint Functionality**: Allows users to mint new NFTs with auto-generated token URIs
- **Burn Functionality**: Enables token owners to burn (destroy) their NFTs
- **Safe Transfer Mechanisms**: Implements `safeTransferFrom()` to prevent accidental loss of tokens
- **Approval System**: Complete approval and operator management for delegated transfers
- **ERC165 Interface Detection**: Supports interface detection for compatibility checks

## Built With

- [Solidity](https://soliditylang.org/) ^0.8.17 - Smart contract programming language
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) - Strings utility library
- [ERC721 Standard](https://eips.ethereum.org/EIPS/eip-721) - Non-Fungible Token Standard

## Getting Started

### Prerequisites

To deploy and interact with this smart contract, you'll need:

- **Remix IDE** (recommended for beginners) - [https://remix.ethereum.org/](https://remix.ethereum.org/)
- **OR** a local development environment:
  - [Node.js](https://nodejs.org/) (LTS version)
  - [Hardhat](https://hardhat.org/) or [Truffle](https://trufflesuite.com/)
- **MetaMask** or another Web3 wallet for deployment and interaction
- **Test ETH** for deployment on testnets (Sepolia, Goerli, etc.)

### Deployment

#### Using Remix IDE (Easiest Method)

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Create a new file named `BasicNFT.sol`
3. Copy and paste the contract code from this repository
4. Compile the contract:
   - Select Solidity compiler version `0.8.17` or higher
   - Click "Compile BasicNFT.sol"
5. Deploy the contract:
   - Go to the "Deploy & Run Transactions" tab
   - Select "Injected Provider - MetaMask" as the environment
   - Connect your MetaMask wallet
   - Click "Deploy"
   - Confirm the transaction in MetaMask

#### Using Hardhat

```bash
# Clone the repository
git clone https://github.com/mabesi/solidity-nft-erc721.git
cd solidity-nft-erc721

# Install dependencies (if you set up a Hardhat project)
npm install

# Deploy using Hardhat (requires hardhat.config.js setup)
npx hardhat run scripts/deploy.js --network <network-name>
```

### Usage

After deployment, you can interact with the contract using Remix, Hardhat, or web3 libraries:

#### Minting an NFT

```solidity
// Call the mint() function
// This will create a new NFT and assign it to msg.sender
mint()
```

#### Checking Balance

```solidity
// Check how many NFTs an address owns
balanceOf(address _owner)
```

#### Getting Token Owner

```solidity
// Find who owns a specific token
ownerOf(uint256 _tokenId)
```

#### Transferring an NFT

```solidity
// Transfer an NFT from one address to another
transferFrom(address _from, address _to, uint256 _tokenId)

// Or use safe transfer (recommended)
safeTransferFrom(address _from, address _to, uint256 _tokenId)
```

#### Burning an NFT

```solidity
// Destroy an NFT (only owner or approved address can burn)
burn(uint256 _tokenId)
```

#### Getting Token URI

```solidity
// Get the metadata URI for a token
tokenURI(uint256 _tokenId)
// Returns: "https://mycollection.com/nft/{tokenId}/metadata"
```

## Smart Contract Details

### Contract Information

- **Contract Name**: BasicNFT
- **Collection Name**: Mabesi Collection
- **Symbol**: MBSCOL
- **Token URI Pattern**: `https://mycollection.com/nft/{tokenId}/metadata`
- **Solidity Version**: ^0.8.17

### Key Functions

| Function | Description | Access |
|----------|-------------|--------|
| `mint()` | Mint a new NFT to msg.sender | Public |
| `burn(uint256 _tokenId)` | Burn (destroy) an NFT | Owner/Approved |
| `balanceOf(address _owner)` | Get NFT balance of an address | View |
| `ownerOf(uint256 _tokenId)` | Get owner of a specific token | View |
| `transferFrom(address _from, address _to, uint256 _tokenId)` | Transfer NFT ownership | Owner/Approved |
| `safeTransferFrom(...)` | Safely transfer NFT with receiver check | Owner/Approved |
| `approve(address _approved, uint256 _tokenId)` | Approve address to transfer token | Owner/Operator |
| `setApprovalForAll(address _operator, bool _approved)` | Set operator for all tokens | Owner |
| `tokenURI(uint256 _tokenId)` | Get metadata URI for token | View |
| `totalSupply()` | Get total number of tokens | View |
| `tokenByIndex(uint256 _index)` | Get token ID by global index | View |
| `tokenOfOwnerByIndex(address _owner, uint256 _index)` | Get token ID by owner index | View |

### Supported Interfaces

The contract implements and supports the following interfaces:

- `ERC165` - Interface detection
- `ERC721` - Core NFT functionality
- `ERC721Metadata` - Name, symbol, and token URI
- `ERC721Enumerable` - Token enumeration and discovery

## Back Matter

### Acknowledgements

- [OpenZeppelin](https://openzeppelin.com/) for the Strings utility library
- [Ethereum Foundation](https://ethereum.org/) for the ERC721 standard specification
- The Solidity and Web3 community for educational resources

### Contributing

Contributions are welcome! If you'd like to improve this educational example:

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Add your changes: `git add .`
4. Commit your changes: `git commit -am 'Add some feature'`
5. Push to the branch: `git push origin my-new-feature`
6. Submit a pull request :sunglasses:

### Authors & Contributors

| [<img loading="lazy" src="https://github.com/mabesi.png" width=115><br><sub>Plinio Mabesi</sub>](https://github.com/mabesi) |
| :---: |

### Legal Disclaimer

<p align="justify">The use of this tool, for any purpose, will occur at your own risk, being your sole responsibility for any legal implications arising from it.</p>
<p align="justify">It is also the end user's responsibility to know and obey all applicable local, state and federal laws. Developers take no responsibility and are not liable for any misuse or damage caused by this program.</p>

### License

This project is licensed under the [MIT License](LICENSE).
