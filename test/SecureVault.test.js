const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("SecureVault", function () {

  let vault , owner;

  beforeEach(async () => {
    [owner] = await ethers.getSigners();

    const Vault = await ethers.getContractFactory("SecureVault");
    vault = await Vault.deploy();
    await vault.waitForDeployment();
  });

  it("should deposit ETH", async () => {
    await vault.connect(owner).deposit({ value: ethers.parseEther("1.0") });

    const balance = await vault.balances(owner.address);
    expect(balance).to.equal(ethers.parseEther("1.0"));
  });

  it("should withdraw ETH" , async () => {
    await vault.connect(owner).deposit({ value : ethers.parseEther("1.0") });
    await vault.connect(owner).withdraw(ethers.parseEther("0.5"));

    const balance = await vault.balances(owner.address);
    expect(balance).to.equal(ethers.parseEther("0.5"));
  });

});
