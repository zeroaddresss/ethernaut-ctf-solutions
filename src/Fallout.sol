// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "openzeppelin-contracts-06/math/SafeMath.sol";

// Goal: claim ownership of the contract

contract Fallout {

    using SafeMath for uint256;
    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    function Fal1out() public payable {
        // this method's name does not match the contract name
        // hence this is not a constructor
        // it is a payable function that we can take advantage of, in order to perform the attack
        owner = msg.sender;
        allocations[owner] = msg.value;
    }

    modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

    function allocatorBalance(address allocator) public view returns (uint) {
        return allocations[allocator];
    }

}