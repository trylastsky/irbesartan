// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.23;

import "openzeppelin_contracts/token/ERC20/ERC20.sol";


contract CMON is ERC20 {
    //entrance
    mapping (address => bool) regStatus;
    mapping (address => string) userName;
    mapping (address => uint) userTimeForReg;

      //addresses
    address Owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address Private = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address Public = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    address Investor1 = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address Investor2 = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    address bestFriend = 0x17F6AD8Ef982297579C203069C1DbfFE4348c372;

    constructor() ERC20("CryptoMonster", "CMON") {
    // 10 000 000 tokens
    _mint(Owner, 10000000); // transfer all tokens for owner 
    _transfer(Owner, Investor1, 300000); // transfer to investor1 300 000 tokens CMON;
    _transfer(Owner, Investor2, 400000); // transfer to investor2 400 000 tokens CMON;
    _transfer(Owner, bestFriend, 200000); // transfer to bestFriend 200 000 tokens CMON;

        
    }

    modifier checkReg(bool e) { // check reg status 
        if (e == false) {
            require(regStatus[msg.sender] == false, "User have been registred");
            _; 
        } else if (e == true) {
            require(regStatus[msg.sender] == true, "User not registred");
            _;
        }
    }

  
    function autoth() public view checkReg(true) returns (string memory name, uint timeForReg, uint balance) {
        return(userName[msg.sender], userTimeForReg[msg.sender], balanceOf(msg.sender));
    }
}