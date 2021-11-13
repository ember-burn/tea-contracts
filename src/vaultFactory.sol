pragma solidity ^0.8.9;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

contract VaultFactory is Ownable {
    
    uint256 public vaultCounter;
    
    event nftTransfer(address to, uint256 tokenID, address tokenContract);
    
    struct Vault {
        //address vaultAddress; will be used once child contract function implemented
        uint256 vaultId;
        string vaultName;
        string vaultDescription;
        address creator;
    }
    
    mapping(uint256 => Vault) public vaultAddresses;
    
    //test function to experiment with erc721 transfer
    function newVault(address _to, uint256 _tokenID, address _tokenContract, string memory _name, string memory _description) public {
        IERC721(_tokenContract).safeTransferFrom(msg.sender, _to, _tokenID);
        vaultAddresses[vaultCounter] = Vault(vaultCounter, _name, _description, msg.sender);
        emit nftTransfer(_to, _tokenID, _tokenContract);
        vaultCounter++;
    }
    
    function returnVaultCount() public view returns(uint256) {
        return vaultCounter;
    }
}
