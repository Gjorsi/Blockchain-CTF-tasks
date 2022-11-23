// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract Contract1 {
  address public owner = msg.sender;
  string public flag;

  // this function runs when the contract is deployed
  constructor(string memory flagInput) {
    // set flag
    flag = flagInput;
  }


  modifier ownerOnly() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }
}