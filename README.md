# VoteContract - Decentralized Voting System

## Overview
Chain-Vote is a Solidity smart contract designed for secure and transparent voting processes on the blockchain. It ensures that only authorized voters can cast their votes and provides mechanisms to manage electoral candidates and tally votes efficiently. The contract leverages mappings for efficient storage and includes access control for administrators.

## Features
- **Admin-Controlled Candidate Registration:** Only authorized administrators can add or remove candidates.
- **Secure Voter Authentication:** Uses hashed authentication data to verify voter identity.
- **Transparent Vote Counting:** Provides real-time vote counts per party.
- **Access Control:** Restricted functions for owner and authorized addresses.

## Contract Details
### State Variables
- `owner`: Stores the contract owner's address.
- `allowedAddresses`: Mapping to manage additional admin addresses.
- `totalNmberOfExpectedVotes`: Tracks the total expected votes for transparency.
- `hashedAuth`: Stores hashed voter authentication data.
- `getPartyDetails`: Mapping to retrieve candidate details by party.
- `getVoteCounts`: Tracks votes for each party.
- `hashedToVotes`: Maps hashed voter IDs to their selected party.
- `hasVoted`: Ensures a voter cannot vote more than once.

### Functions
#### Admin Functions
- `setExpectedVoteCounts(uint256 voteCount)`: Sets the expected number of votes.
- `addCandidates(string memory _party, string memory _candidate)`: Registers a candidate under a party.
- `removeCandidates(string memory party)`: Removes a candidate from a party.

#### Voting Functions
- `implementSHA256(uint256 fingerprintHex)`: Placeholder for implementing SHA256 hashing for voter authentication.
- `voteAction(bytes32 voterID, string memory party)`: Allows authorized voters to cast their votes.
- `getVoteCountsPerParty(string memory partyQueried)`: Retrieves the current vote count for a specific party.
- `getVoteCountsOfAllParties()`: Retrieves vote counts for all parties (to be implemented).

### Modifiers
- `onlyAdmin`: Restricts function access to the contract owner.
- `onlyAuthorizedWallets`: Ensures only allowed addresses can execute restricted functions.

## Security Considerations
- Ensures only **authorized voters** can vote using hashed authentication.
- Prevents **duplicate voting** by maintaining a `hasVoted` mapping.
- Implements **admin restrictions** for critical actions like setting expected votes and adding candidates.

## Installation & Deployment
### Prerequisites
- Foundry installed (`forge` CLI)
- Solidity compiler (`solc`)

### Compile the Contract
```sh
forge build
```

### Deploy the Contract
```sh
forge create --private-key <your_private_key> VoteContract --constructor-args <owner_address>
```

### Run Tests
```sh
forge test
```

## Future Improvements
- Implement a hashing function for **secure voter ID authentication**.
- Optimize data structures to **reduce gas costs**.
- Develop a frontend interface for **seamless interaction** with the contract.

## License
This project is licensed under the **MIT License**.

## Author
Developed by Joshua Favour

