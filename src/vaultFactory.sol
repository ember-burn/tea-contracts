//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

contract VaultFactory is Ownable {
    
    event nftTransfer(address to, uint256 tokenID, address tokenContract);
    
    //test function to experiment with erc721 transfer
    function transfer(address _to, uint256 _tokenID, address _tokenContract) public {
        IERC721(_tokenContract).safeTransferFrom(msg.sender, _to, _tokenID);
        emit nftTransfer(_to, _tokenID, _tokenContract);
    }
}
