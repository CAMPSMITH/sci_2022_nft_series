// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./ERC2981.sol";

contract SaveCuestaInletNFTMinter is AccessControl, ERC2981{
    event Received(address sender,uint256 amount);
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint96 public constant minterFee = 75;
    constructor(){
        _grantRole(DEFAULT_ADMIN_ROLE,msg.sender);
        grantRole(MINTER_ROLE,msg.sender);   
        _setFee(msg.sender,minterFee);
    }

    function mint(uint token_id, uint sale_price, string memory token_uri) public payable funded onlyRole(MINTER_ROLE){
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(AccessControl, ERC2981)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    receive() external payable {
        emit Received(msg.sender,msg.value);
    }

    fallback () external payable{
        emit Received(msg.sender,msg.value);
    }

}