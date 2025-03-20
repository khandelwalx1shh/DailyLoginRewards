pragma solidity ^0.8.0;

contract DailyLoginRewards {
    mapping(address => uint256) public lastLogin;
    mapping(address => uint256) public rewards;
    uint256 public rewardAmount = 1 ether;
    uint256 public timeInterval = 1 days;

    function login() public {
        if (block.timestamp >= lastLogin[msg.sender] + timeInterval) {
            rewards[msg.sender] += rewardAmount;
            lastLogin[msg.sender] = block.timestamp;
        }
    }
    
    function checkReward(address user) public view returns (uint256) {
        return rewards[user];
    }
}
