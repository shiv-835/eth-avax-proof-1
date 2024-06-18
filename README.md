# Demonstration of Error Handling in Solidity

This repository contains a Solidity smart contract designed to demonstrate various error handling mechanisms in Ethereum smart contracts. The contract includes examples of `require`, `assert`, and `revert` statements to enforce conditions and handle errors.

## Contract Overview

The `ErrorHandlingDemonstration` contract includes the following functionalities:

- **Owner Management**: The contract owner is set upon deployment.
- **Ether Deposits**: Users can deposit Ether into the contract.
- **Ether Withdrawals**: Only the owner can withdraw Ether, subject to balance constraints.
- **Balance Checking**: Users can check the contract's balance.
- **Forced Reverts**: A function to demonstrate the use of `revert` for error handling.

## Functions

### Constructor

```solidity
constructor() {
    owner = msg.sender;
    balance = 0;
}
```

- Sets the contract deployer as the owner.
- Initializes the balance to 0.

### `depositEther`

```solidity
function depositEther(uint _amount) public payable {
    require(_amount > 0, "Deposit amount should be greater than zero");
    balance += _amount;
}
```

- Allows users to deposit Ether into the contract.
- Ensures the deposit amount is greater than zero.

### `withdrawEther`

```solidity
function withdrawEther(uint _amount) public payable {
    require(owner == msg.sender, "Only the account holder can withdraw funds");
    require(_amount <= balance, "Insufficient balance.. Can't withdraw");
    balance -= _amount;
}
```

- Allows the owner to withdraw Ether from the contract.
- Ensures that only the owner can withdraw funds.
- Checks that the withdrawal amount does not exceed the contract's balance.

### `checkBalance`

```solidity
function checkBalance() public view returns (uint) {
    assert(balance >= 0);
    return balance;
}
```

- Returns the contract's current balance.
- Asserts that the balance is non-negative.

### `forceRevert`

```solidity
function forceRevert() public pure {
    revert("This is a forced revert");
}
```

- Demonstrates the use of `revert` to forcefully trigger an error.

## Getting Started

### Prerequisites

- Solidity ^0.8.13
- An Ethereum development environment such as [Remix](https://remix.ethereum.org/), [Truffle](https://www.trufflesuite.com/truffle), or [Hardhat](https://hardhat.org/).

### Deployment

1. Clone the repository:
   ```sh
   git clone https://github.com/shiv-835/eth-avax-proof-1.git
   ```
2. Navigate to the project directory:
   ```sh
   cd ErrorHandlingDemonstration
   ```
3. Compile the contract using your preferred development environment.

4. Deploy the contract to your desired Ethereum network.

### Usage

1. Deposit Ether into the contract using `depositEther`.
2. Withdraw Ether using `withdrawEther` (only the owner can do this).
3. Check the contract's balance with `checkBalance`.
4. Trigger a forced revert with `forceRevert`.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Contact

For any questions or issues, feel free to mail at workcu835@gmail.com
