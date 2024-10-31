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
        string memory tweetContent = "Hello, this is a test tweet";

        // Simulate msgSender calling postTweet
        vm.prank(msgSender);
        twitter.createTweet(tweetContent);

        // Retrieve the tweet and check if it matches the expected content
        string memory retrievedTweet = twitter.getTweet(msgSender, 0);
        assertEq(retrievedTweet, tweetContent, "Tweet content mismatch");
    }
}
