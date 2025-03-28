// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting {
    mapping(string => uint) votes;
    function vote(string memory candidate) public {
        votes[candidate]++;
    }
    function getVotes(string memory candidate) public view returns (uint) {
        return votes[candidate];
    }
}