// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract Contract2 {
  address public owner = msg.sender;
  string public flag1;
  string private flag2 = "testflag";
  address public friend;

  // this function runs when the contract is deployed
  constructor(string memory flagInput) {
    // set flag
    flag1 = flagInput;
  }

  function constructFlag (string memory flag) internal pure returns (string memory) {
    return string.concat("capctf{", flag, "}");
  }

  function getFlag2 () external view isFriend returns(string memory) {
    return constructFlag(flag2);
  }

  function setFlag1 (string memory flg) external ownerOnly {
    flag1 = flg;
  }
  
  modifier isFriend() {
    require(
      msg.sender == friend,
      "This function is restricted to a friend of the contract"
    );
    _;
  }

  modifier ownerOnly() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }
}