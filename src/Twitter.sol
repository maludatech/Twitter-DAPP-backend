//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Twitter {
    uint16 public constant MAX_TWEET_LENGTH = 280;
    address public owner;
    bool public paused;

    // Define our struct
    struct Tweet {
        address author;
        string content;
        uint256 timeStamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    constructor() {
        owner = msg.sender;
        paused = false;
    }

    modifier onlyOwner() {
        require(
            owner == msg.sender,
            "Only the owner of the account is allowed to create a tweet."
        );
        _;
    }
    modifier notPaused() {
        require(paused == false, "Contract is paused");
        _;
    }

    function createTweet(string memory _tweet) public {
        require(
            bytes(_tweet).length <= MAX_TWEET_LENGTH,
            "Tweet should not be more than 280 characters"
        );
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timeStamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(
        address _owner,
        uint _i
    ) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }
    function getAlltweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
