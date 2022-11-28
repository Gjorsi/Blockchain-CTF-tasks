// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17 <0.9.0;

interface Contract2I{
  function getFlag4 () external view returns (string memory);
}

contract Contract1 {
  address public owner = msg.sender;

  function getFlag4 (address addr) external view returns (string memory) {
    Contract2I c2 = Contract2I(addr);
    return c2.getFlag4();
  }

  modifier ownerOnly() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }
}