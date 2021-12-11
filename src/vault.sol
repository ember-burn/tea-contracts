
pragma solidity ^0.8.10;
//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/ownable.sol";

contract Vault is ERC20, Ownable {
    bool public isCalled = False;

    event BuyoutInitiated();
    event FractionsCreated();

    function placeBid(uint256 _amount) {
        
    }

    function createFractions(uint256 _amount) {
        require(isCalled == False, "Fractions already claimed")
        _mint(msg.sender, _amount);
        isCalled = true;
    }
}
