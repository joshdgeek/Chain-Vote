// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {VoteContract} from "../src/chain-vote.sol";

contract CounterTest is Test {
    VoteContract public voteContract;
    address admin;

    function setUp() public {
        voteContract = new VoteContract(msg.sender);
        admin = msg.sender;
    }

    function testVotecount() public {
        vm.prank(admin);
        voteContract.setExpectedVoteCounts(1000);

        assertEq(voteContract.totalNmberOfExpectedVotes(), 1000);
    }
}
