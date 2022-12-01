// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract ContractB {
  mapping(uint16 => string) private flags;
  mapping(address => bool) public paid;

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

  function payToWinFlag () public view returns (string memory) {
    if (paid[msg.sender]) return assembleFlag(flags[2]);
    else return "Sender has not paid to view the flag";
  }

  function payToWin () external payable {
    uint cost = 1e15;
    require(msg.value >= cost, "Not enough Goerli ETH was sent.");
    paid[msg.sender] = true;
  }
}