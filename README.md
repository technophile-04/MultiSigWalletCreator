# 👛 MultiSigCreator

✨ Frontend : https://multisigcreator-sb.surge.sh/

✨ Contract deployed on Goerli testnet: https://goerli.etherscan.io/address/0x7f501b9EdFCFd337233780eB5D843f3476e7FF66#code

✨ For MultiSigWallet core contract logic checkout : `packages/hardhat/contracts/MultiSigWallet.sol`

Create multiple multisignature wallets and see their details as well as propose, execute, and sign transactions - all in just a few clicks.

# 🏄‍♂️ Getting Started Locally

Prerequisites: [Node (v16 LTS)](https://nodejs.org/en/download/) plus [Yarn](https://classic.yarnpkg.com/en/docs/install/) and [Git](https://git-scm.com/downloads)

> clone/fork 👛 MultiSigCreator:

```bash
git clone https://github.com/technophile-04/MultiSigWalletCreator.git
```

> install and start your 👷‍ Hardhat chain:

```bash
cd MultiSigWalletCreator
yarn install
yarn chain
```

> in a second terminal window, start your 📱 frontend:

```bash
cd MultiSigWalletCreator
yarn start
```

> in a third terminal window, 🛰 deploy your contract:

```bash
cd MultiSigWalletCreator
yarn deploy
```

> in a fourth terminal window, 🗄 start your backend:

```bash
cd MultiSigWalletCreator
yarn backend
```

> You are ready to go 🚀

📱 Open http://localhost:3000 to see the app

🚀 Built with [Scaffold-Eth](https://github.com/scaffold-eth/scaffold-eth)
