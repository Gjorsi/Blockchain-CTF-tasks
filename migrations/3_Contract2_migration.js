// Help Truffle find `TestContract.sol` in the `/contracts` directory
const Contract2 = artifacts.require("Contract2");

module.exports = function(deployer) {
  // Command Truffle to deploy the Smart Contract
  deployer.deploy(Contract2, "capctf{testflag}");
};