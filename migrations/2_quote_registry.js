var Migrations = artifacts.require("./QuoteRegistry.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
