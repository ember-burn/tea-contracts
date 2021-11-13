//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//OpenZeppelin
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

//homemade
import './src/vault.sol';

contract VaultFactory is Ownable {
    
    uint256 public vaultCounter;
    
    event nftTransfer(address to, uint256 tokenID, address tokenContract);
    
    mapping(uint256 => address) public vaultAddresses;
    
    //test function to experiment with erc721 transfer
    function newVault(address _to, uint256 _tokenID, address _tokenContract) public {
        IERC721(_tokenContract).safeTransferFrom(msg.sender, _to, _tokenID);
        vaultAddresses[vaultCounter] = address(msg.sender);
        emit nftTransfer(_to, _tokenID, _tokenContract);
        vaultCounter++;
    }
    
    function returnVaultCount() public view returns(uint256) {
        return vaultCounter;
    }
}
