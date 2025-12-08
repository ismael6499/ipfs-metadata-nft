// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract PopNFTCollection is ERC721{

    uint256 public currentTokenId;
    uint256 public totalSuply;

    event MintNFT(address userAddress, uint256 tokenId);

    constructor(string memory _name, string memory _symbol, uint256 _totalSuply) ERC721(_name, _symbol){
        totalSuply = _totalSuply;
    }

    function mint() external {
        require(currentTokenId < totalSuply, "Sold out");
        address userAddress = msg.sender;
        uint256 tokenId = currentTokenId;
        _safeMint(userAddress, tokenId);
        currentTokenId++;
        emit MintNFT(userAddress, tokenId);
    }

}

