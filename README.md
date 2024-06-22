
# TaskManager Smart Contract - Error Handling Demonstration

## Overview

The `TaskManager` smart contract is designed to manage a list of tasks on the Ethereum blockchain. It allows users to create and complete tasks while maintaining a log of these actions through events. The contract also includes functionality for the contract owner to withdraw any Ether accumulated in the contract.

## Features

- Create tasks with a content description.
- Mark tasks as completed.
- Retrieve details of individual tasks.
- Get the total count of tasks created.
- Contract owner can withdraw all Ether from the contract.
- Events for task creation and completion.
- Ether transfers to the contract are accepted.

## Contract Details

### State Variables

- `address public owner`: Stores the address of the contract owner.
- `uint public taskCount`: Keeps track of the number of tasks created.
- `mapping(uint => Task) public tasks`: Maps task IDs to Task structs.

### Structs

- `struct Task`: Represents a task with the following fields:
  - `uint id`: Unique identifier for the task.
  - `string content`: Description of the task.
  - `bool completed`: Status of the task (completed or not).

### Events

- `event TaskCreated(uint indexed taskId, string content)`: Emitted when a new task is created.
- `event TaskCompleted(uint indexed taskId)`: Emitted when a task is marked as completed.

## Functions

### Constructor

```solidity
constructor() {
    owner = msg.sender;
    taskCount = 0;
}
```
- Sets the contract deployer as the owner.
- Initializes the task count to zero.

### Modifiers

- `modifier onlyOwner()`: Ensures that only the contract owner can call certain functions.

### Public Functions

- `function createTask(string memory _content) public`: Allows users to create a new task with a non-empty content.
- `function completeTask(uint _taskId) public`: Allows users to mark a task as completed if it exists and is not already completed.
- `function getTask(uint _taskId) public view returns (uint, string memory, bool)`: Retrieves the details of a task by its ID.
- `function getTaskCount() public view returns (uint)`: Returns the total number of tasks created.
- `function ownerWithdraw() public onlyOwner`: Allows the contract owner to withdraw all Ether from the contract if the balance is greater than zero.

### Fallback Function

- `receive() external payable`: Accepts Ether transfers to the contract. Reverts the transaction if zero Ether is sent.

## Usage

### Deploying the Contract

1. Deploy the `TaskManager` contract using a Solidity-compatible environment like Remix, Truffle, or Hardhat.
2. The contract deployer becomes the owner of the contract.

### Interacting with the Contract

- **Create a Task**: Call `createTask` with the task content.
- **Complete a Task**: Call `completeTask` with the task ID.
- **Get Task Details**: Call `getTask` with the task ID to retrieve its details.
- **Get Task Count**: Call `getTaskCount` to get the total number of tasks created.
- **Withdraw Ether**: If you are the contract owner, call `ownerWithdraw` to withdraw all Ether from the contract.

## Security Considerations

- Only the contract owner can withdraw Ether from the contract.
- Ensure that task content is not empty when creating a task.
- Validate task ID existence before completing a task or retrieving task details.
- Avoid sending zero Ether to the contract.

---
