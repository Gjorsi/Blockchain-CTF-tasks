// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract ContractD1 {
  mapping(uint16 => string) private flags;
  address public friend;

  constructor(string[] memory flagInput, address friendAddr) {
    friend = friendAddr;
    // set flags
    flags[2] = flagInput[1];
    flags[5] = flagInput[93];
    flags[4] = flagInput[59];
    flags[3] = flagInput[56];
    flags[1] = flagInput[23];
  }

  function assembleFlag (string memory flag) internal pure returns (string memory) {
    return string.concat("capctf{", flag, "}");
  }

  function contractLoophole () external view isFriend returns (string memory) {
    return assembleFlag(flags[4]);
  }
  
  modifier isFriend() {
    require(
      msg.sender == friend,
      "This function is restricted to a friend of the contract"
    );
    _;
  }
}