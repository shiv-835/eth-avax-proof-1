// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TaskManager {
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    address public owner;
    uint public taskCount;
    mapping(uint => Task) public tasks;

    event TaskCreated(uint indexed taskId, string content);
    event TaskCompleted(uint indexed taskId);

    constructor() {
        owner = msg.sender;
        taskCount = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    function createTask(string memory _content) public {
        require(bytes(_content).length > 0, "Task content cannot be empty");
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content);
    }

    function completeTask(uint _taskId) public {
        require(_taskId > 0 && _taskId <= taskCount, "Task ID does not exist");
        require(!tasks[_taskId].completed, "Task is already completed");

        tasks[_taskId].completed = true;
        emit TaskCompleted(_taskId);
    }

    function getTask(uint _taskId) public view returns (uint, string memory, bool) {
        require(_taskId > 0 && _taskId <= taskCount, "Task ID does not exist");

        Task memory task = tasks[_taskId];
        return (task.id, task.content, task.completed);
    }

    function getTaskCount() public view returns (uint) {
        assert(taskCount >= 0);
        return taskCount;
    }

    function ownerWithdraw() public onlyOwner {
        uint balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        payable(owner).transfer(balance);
    }

    receive() external payable {
        if (msg.value == 0) {
            revert("Cannot send zero Ether");
        }
    }
}
