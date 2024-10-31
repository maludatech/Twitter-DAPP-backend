//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Twitter {
    // Define our struct
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => string[]) public tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }
    function getTweet(
        address _owner,
        uint _i
    ) public view returns (string memory) {
        return tweets[_owner][_i];
    }
    function getAlltweets(
        address _owner
    ) public view returns (string[] memory) {
        return tweets[_owner];
    }
}
