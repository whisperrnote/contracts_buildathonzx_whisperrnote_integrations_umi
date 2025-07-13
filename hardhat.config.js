require("@nomicfoundation/hardhat-toolbox");
require("@moved/hardhat-plugin");

module.exports = {
  defaultNetwork: "devnet",
  networks: {
    devnet: {
      url: "https://devnet.uminetwork.com",
      accounts: ["0x97ccdedd46f93f567e4215635db46258d2ad2b9de6cfe7ff894e336649a83f86"]
    }
  }
};