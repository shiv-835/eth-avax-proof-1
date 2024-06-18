// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ErrorHandlingDemonstration{
    address public owner;
    uint public balance;

    constructor(){
        owner = msg.sender;
        balance = 0;
    }

    function depositEther(uint _amount) public payable{
        require(_amount > 0, "Deposit amount should be greater than zero");
        balance += _amount;
    }

    function withdrawEther(uint _amount) public payable {
        require(owner == msg.sender,"Only the account holder can withdraw funds");
        require(_amount <= balance,"Insufficient balance.. Can't withdraw");

        balance -= _amount;
    } 

    function checkBalance() public view returns (uint) {
        assert(balance >= 0);
        return balance;
    }

    function forceRevert() public pure{
        revert("This is a forced revert");
    }
}
