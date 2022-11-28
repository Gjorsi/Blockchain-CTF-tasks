// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

interface Contract2I{
  function contractLoophole () external view returns (string memory);
}

contract Contract1 {
  address public owner = msg.sender;

  function callFriendContract (address addr) external view returns (string memory) {
    Contract2I c2 = Contract2I(addr);
    return c2.contractLoophole();
  }

  modifier ownerOnly() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }
}