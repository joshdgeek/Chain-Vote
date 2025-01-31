// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {VoteContract} from "../src/chain-vote.sol";

contract DeployScript is Script {
    VoteContract public voteContract;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        voteContract = new VoteContract(msg.sender);

        vm.stopBroadcast();
    }
}
