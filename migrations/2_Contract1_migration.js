// Help Truffle find `TestContract.sol` in the `/contracts` directory
const Contract1 = artifacts.require("Contract1");

module.exports = function(deployer) {
  // Command Truffle to deploy the Smart Contract
  deployer.deploy(Contract1, "capctf{testflag}");
};