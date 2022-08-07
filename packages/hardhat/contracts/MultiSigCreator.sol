// SPDX-License-Identifier:MIT
pragma solidity ^0.8.3;
import "./MultiSigWallet.sol";

/** @title MultiSigCreator Contract
 *  @author Shiv Bhonde
 *  @notice This contract which helps you create MultiSigWallet
 *  @dev This contract keeps map of all the MultiSigs Created
 */

contract MultiSigCreator {
    /* ========== STATE VARIABLES ========== */
    MultiSigWallet[] public multiSigs;
    mapping(address => bool) existsMultiSig;

    /* ========== Events  ========== */
    event MultiSigWalletCreate(
        uint256 indexed contractId,
        address indexed contractAddress,
        address creator,
        address[] owners,
        uint256 signaturesRequired
    );

    event Owners(
        address indexed contractAddress,
        address[] owners,
        uint256 indexed signaturesRequired
    );

    /* ========== Modifiers  ========== */
    modifier onlyRegisteredWallet() {
        require(
            existsMultiSig[msg.sender],
            "caller must be create by the MultiSigMagician"
        );
        _;
    }

    /* ========== Functions  ========== */

    receive() external payable {}

    fallback() external payable {}

    function createMultiSigWallet(
        uint256 _chainId,
        address[] memory _owners,
        uint256 _signaturesRequired
    ) public payable {
        uint256 walletId = multiSigs.length - 1;
        MultiSigWallet newWallet = new MultiSigWallet{value: msg.value}(
            _chainId,
            _owners,
            _signaturesRequired,
            payable(address(this))
        );

        address walletAddress = address(newWallet);
        require(
            !existsMultiSig[walletAddress],
            "createMultiSigWallet : wallet already exists"
        );

        multiSigs.push(newWallet);
        existsMultiSig[walletAddress] = true;

        emit MultiSigWalletCreate(
            walletId,
            walletAddress,
            msg.sender,
            _owners,
            _signaturesRequired
        );

        emit Owners(walletAddress, _owners, _signaturesRequired);
    }

    function numberOfMultiSigsCreated() public view returns (uint256) {
        return multiSigs.length;
    }

    function getMultiSig(uint256 _index)
        public
        view
        returns (
            address _walletAddress,
            uint256 _signaturesRequired,
            uint256 _balance
        )
    {
        MultiSigWallet wallet = multiSigs[_index];
        _walletAddress = address(wallet);
        _signaturesRequired = wallet.minSignaturesRequired();
        _balance = address(wallet).balance;
    }

    function emitOwners(
        address _contractAddress,
        address[] memory _owners,
        uint256 _signaturesRequired
    ) external onlyRegisteredWallet {
        emit Owners(_contractAddress, _owners, _signaturesRequired);
    }
}
