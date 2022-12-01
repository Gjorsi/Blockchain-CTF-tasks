// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract ContractE {
  mapping(uint16 => string) private flags;

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

  function isContract (address _addr) internal view returns (bool) {
    uint32 size;
    assembly {
      size := extcodesize(_addr)
    }
    return (size > 0);
  }

  function yourTurn () external view returns (string memory) {
    require(isContract(msg.sender));
    return assembleFlag(flags[5]);
  }
}