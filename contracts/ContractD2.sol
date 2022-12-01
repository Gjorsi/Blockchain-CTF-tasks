// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

interface ContractDInterface{
  function contractLoophole () external view returns (string memory);
}

contract ContractD2 {
  function callFriendContract (address addr) external view returns (string memory) {
    ContractDInterface c2 = ContractDInterface(addr);
    return c2.contractLoophole();
  }
}