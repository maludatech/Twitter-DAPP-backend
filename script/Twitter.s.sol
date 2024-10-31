//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Twitter} from "../src/Twitter.sol";
import {Script} from "forge-std/Script.sol";

contract DeployTwitter is Script {
    function run() external returns (Twitter) {
        vm.startBroadcast();
        Twitter twitter = new Twitter();
        vm.stopBroadcast();
        return twitter;
    }
}
