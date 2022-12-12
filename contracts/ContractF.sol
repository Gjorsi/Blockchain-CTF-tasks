// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import "./utils/Strings.sol";

contract ContractF {
  mapping(uint16 => string) private flags;
  mapping(address => uint64) private balance;

  constructor(string[] memory flagInput) {
    // set flags
    flags[2] = flagInput[1];
    flags[5] = flagInput[93];
    flags[4] = flagInput[59];
    flags[3] = flagInput[56];
    flags[6] = flagInput[11];
    flags[1] = flagInput[23];
  }

  function assembleFlag (string memory flag) internal pure returns (string memory) {
    return string(abi.encodePacked("capctf{", flag, "}"));
  }

  function register (address customerAddr) external {
    require(balance[customerAddr]  == 0, "Customer is already registered.");
    // award welcome bonus
    balance[customerAddr] = 1e16;
  }

  function withdraw (address customerAddr, uint64 amount) external {
    require(balance[customerAddr]  != 0, "Customer must register first.");
    uint64 newBalance = balance[customerAddr] - amount;
    require(newBalance >= 0, "Cannot withdraw more than balance");
    balance[customerAddr] = newBalance;
  }

  function checkBalance (address customerAddr) external view returns (string memory) {
    if (balance[customerAddr] > 18e18) {
      // 18 ETH
      return assembleFlag(flags[6]);
    } else {
      return Strings.toString(balance[customerAddr]);
    }
  }
}