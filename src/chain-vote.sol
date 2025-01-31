// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract VoteContract {
    address public owner;

    mapping(address => bool) private allowedAddresses; //additional admins

    constructor(address _owner) {
        owner = _owner; //set owner variable
    }

    //create a struct for each party
    struct Running_Party {
        string party; // All party names should be in CAPS
        string candidate; //All candidates should be in CAPS;
    }

    //Set to the numbers of registered voters, set by owner;
    uint256 public totalNmberOfExpectedVotes;

    //storing hashed fingerprint data, or encoded data for voters
    bytes32[] public hashedAuth;

    // storing the electoral Candidates
    uint256[] public electoralCandidates; //to reduce storage slots this might be removed. This data will then be accessed by the RunningParty struct

    //storing the parties
    uint256[] public electoralParties; //to reduce storage slots this might be removed. This data will then be accessed by the RunningParty struct

    //get mapping of the running party
    mapping(string => Running_Party) public getPartyDetails;

    //Party to vote-counts mapping : updates votecounts of each party;
    mapping(string => uint256) public getVoteCounts;

    //mapping the hashedAuth to the selected Running_Party
    mapping(bytes32 => Running_Party) public hashedToVotes;

    //check if an voter exists
    mapping(bytes32 => bool) public hasVoted;

    //a function to set the total number of expected votes for transparency purposes
    function setExpectedVoteCounts(uint256 voteCount) public onlyAdmin returns (uint256) {
        totalNmberOfExpectedVotes = voteCount;
        return totalNmberOfExpectedVotes;
    }

    function addCandidates(string memory _party, string memory _candidate) public onlyAdmin {
        //check if a canddidate has been registered under the party to be added
        require(
            bytes(getPartyDetails[_party].candidate).length == 0, "A candidate has already been assigned to this party"
        );
        Running_Party storage candidate_details = getPartyDetails[_party];
        candidate_details.party = _party;
        candidate_details.candidate = _candidate;
        getPartyDetails[_candidate] = candidate_details;
    }

    //resetting candidates of a party
    function removeCandidates(string memory party) public onlyAdmin {
        delete getPartyDetails[party];
    }

    //run hashing algorithm before updating arrays and maps
    function implementSHA256(uint256 fingerprintHex) public {}

    function voteAction(bytes32 voterID, string memory party) public onlyAuthorizedWallets {
        // adopt mapping instead of looping through arrays to decerease valdation time
        require(!hasVoted[voterID], "This identity has already voted");
        hashedAuth.push(voterID);
        getVoteCounts[party] += 1;
    }

    //return current for each party when queried
    function getVoteCountsPerParty(string memory partyQueried) public view returns (uint256) {
        uint256 result;
        result = getVoteCounts[partyQueried];
        return result;
    }

    function getVoteCountsOfAllParties() public {
        //return an object blob of all the data
    }

    // modifier to restrict function to certain addresses.
    modifier onlyAdmin() {
        require(msg.sender == owner, "AUTHORIZATION ERROR");
        _;
    }

    modifier onlyAuthorizedWallets() {
        require(allowedAddresses[msg.sender] == true, "not authorized to use this contract");
        _;
    }
}
