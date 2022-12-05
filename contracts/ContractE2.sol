// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

interface ContractEInterface{
  function yourTurn () external view returns (string memory);
}

contract ContractE2 {
  function callFriendContract (address addr) external view returns (string memory) {
    ContractEInterface e2 = ContractEInterface(addr);
    return e2.yourTurn();
  }
}