// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

contract Contract2 {
  address public owner = msg.sender;
  mapping(uint16 => string) private flags;
  address public friend;
  bytes public codeword = "proofofstake";

  // this function runs when the contract is deployed
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

  function flagOnAChain () external view returns (string memory) {
    return assembleFlag(flags[1]);
  }

  function payToWin () external payable returns (string memory) {
    uint cost = 1e15;
    require(msg.value >= cost, "Not enough Goerli ETH was sent.");
    return assembleFlag(flags[2]);
  }

  function actuallyGetFlag () internal view returns (string memory) {
    return assembleFlag(flags[3]);
  }

  function readTheContract (bytes memory codewordInput) external view returns (string memory) {
    require(keccak256(codeword) == keccak256(codewordInput), "Incorrect codeword");
    return actuallyGetFlag();
  }

  function contractLoophole () external view isFriend returns (string memory) {
    return assembleFlag(flags[4]);
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