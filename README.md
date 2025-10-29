# Proofcert

# 🧾 ProofCert - Immutable Credential Registry

## 📖 Project Description
**ProofCert** is a beginner-friendly Solidity smart contract that enables users to store and verify their **earned credentials** immutably on the blockchain.  
It’s designed to make academic and professional certificates **permanent**, **verifiable**, and **tamper-proof**, removing the need for centralized verification systems.

---

## 💡 What It Does
ProofCert allows anyone to:
- Record earned credentials (like course completions, degrees, or certifications) on-chain.
- Store details such as **certificate name**, **issuer**, and **date issued**.
- Retrieve all credentials associated with any wallet address.
- Verify authenticity without relying on intermediaries — data is transparent and immutable.

---

## ✨ Features
- 🧱 **Simple and Beginner-Friendly:** Ideal for learning Solidity and blockchain concepts.  
- 🔒 **Immutable Records:** Once stored, credentials cannot be modified or deleted.  
- 👤 **Self-Managed:** Each wallet owner adds their own credentials.  
- 🌍 **Public Verification:** Anyone can view on-chain credentials by entering a user’s address.  
- ⚡ **Gas-Efficient:** Minimal design using structs, mappings, and events.

---

## 🔗 Deployed Smart Contract
**Network:** Celo Sepolia Testnet  
**Contract Address:** [`0x4C98d902ad3b1cD4cE8161C5e78E22A41AD20e85`](https://celo-sepolia.blockscout.com/address/0x4C98d902ad3b1cD4cE8161C5e78E22A41AD20e85)  

You can explore the contract, view transactions, and verify records directly on **Blockscout**.

---

## 🧠 Smart Contract Code

```solidity
pragma solidity ^0.8.20;

// A simple contract for storing immutable proof of earned credentials
contract ProofCert {
    // Struct to store credential details
    struct Credential {
        string certName;     // Name of the certificate or course
        string issuer;       // Who issued it
        uint256 issuedDate;  // Timestamp of issuance
    }

    // Mapping from user address => list of credentials
    mapping(address => Credential[]) private userCredentials;

    // Event emitted when a new credential is added
    event CredentialAdded(address indexed user, string certName, string issuer, uint256 issuedDate);

    // Function for a user to add their earned credential
    function addCredential(string memory _certName, string memory _issuer) public {
        Credential memory newCredential = Credential({
            certName: _certName,
            issuer: _issuer,
            issuedDate: block.timestamp
        });

        userCredentials[msg.sender].push(newCredential);
        emit CredentialAdded(msg.sender, _certName, _issuer, block.timestamp);
    }

    // View all credentials of a specific user
    function getCredentials(address _user) public view returns (Credential[] memory) {
        return userCredentials[_user];
    }
}
