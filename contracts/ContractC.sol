// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract ContractC {
  mapping(uint16 => string) private flags;
  bytes public codeword = "proofofstake";

  constructor(string[] memory flagInput) {
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

  function actuallyGetFlag () internal view returns (string memory) {
    return assembleFlag(flags[3]);
  }

  function readTheContract (string memory codewordInput) external view returns (string memory) {
    require(keccak256(codeword) == keccak256(bytes(codewordInput)), "Incorrect codeword");
    return actuallyGetFlag();
  }
}