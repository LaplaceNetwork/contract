pragma solidity ^0.4.8;

contract Migrations {
    address public owner;

    // A function with the signature `last_completed_migration()`, returning a uint, is required.
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) {
            _;
        }
    }

    constructor() public {
        owner = msg.sender;
    }

    // A function with the signature `setCompleted(uint)` is required.
    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}