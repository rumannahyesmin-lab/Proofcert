// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
<p align="center">
  <img src="Screenshot%202025-10-29%20145829.png" alt="ProofCert Screenshot" width="600">
</p>

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

