// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Twitter} from "../src/Twitter.sol";
import {Test} from "forge-std/Test.sol";

contract TestTwitter is Test {
    Twitter twitter;

    function setUp() public {
        twitter = new Twitter();
    }

    function testUserTweetPosting() public {
        // Simulate a specific address to act as the sender
        address msgSender = address(0x123);
        string memory tweetContent = "Hello, web3 twitter";

        // Simulate msgSender calling createTweet
        vm.prank(msgSender);
        twitter.createTweet(tweetContent);

        // Retrieve the tweet content and check if it matches the expected content
        Twitter.Tweet memory retrievedTweet = twitter.getTweet(msgSender, 0);
        assertEq(
            retrievedTweet.content,
            tweetContent,
            "Tweet content mismatch"
        );
    }
}
