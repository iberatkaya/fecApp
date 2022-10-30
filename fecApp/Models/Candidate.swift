//
//  Candidate.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/20/22.
//

import Foundation


// MARK: - Result
struct Candidate: Codable {
    let electionYears, cycles: [Int]?
    let incumbentChallenge: String?
    let candidateStatus: String?
    let state: String?
    let firstFileDate: String?
    let district: String?
    let principalCommittees: [PrincipalCommittee]?
    let lastF2Date: String?
    let party: String?
    let candidateInactive: Bool?
    let districtNumber: Int?
    let office: String?
    let lastFileDate: String?
    let hasRaisedFunds, federalFundsFlag: Bool?
    let candidateID, officeFull: String?
    let activeThrough: Int?
    let inactiveElectionYears: [Int]?
    let incumbentChallengeFull: String?
    let electionDistricts: [String?]?
    let name, partyFull: String?
    let loadDate: String?

    enum CodingKeys: String, CodingKey {
        case electionYears = "election_years"
        case cycles
        case incumbentChallenge = "incumbent_challenge"
        case candidateStatus = "candidate_status"
        case state
        case firstFileDate = "first_file_date"
        case district
        case principalCommittees = "principal_committees"
        case lastF2Date = "last_f2_date"
        case party
        case candidateInactive = "candidate_inactive"
        case districtNumber = "district_number"
        case office
        case lastFileDate = "last_file_date"
        case hasRaisedFunds = "has_raised_funds"
        case federalFundsFlag = "federal_funds_flag"
        case candidateID = "candidate_id"
        case officeFull = "office_full"
        case activeThrough = "active_through"
        case inactiveElectionYears = "inactive_election_years"
        case incumbentChallengeFull = "incumbent_challenge_full"
        case electionDistricts = "election_districts"
        case name
        case partyFull = "party_full"
        case loadDate = "load_date"
    }
}

// MARK: - PrincipalCommittee
struct PrincipalCommittee: Codable {
    let cycles: [Int]?
    let firstFileDate, state, filingFrequency: String?
    let affiliatedCommitteeName: String?
    let committeeType, designation, lastF1Date: String?
    let organizationTypeFull: String?
    let party: String?
    let lastFileDate, committeeID, treasurerName: String?
    let candidateIDS: [String]?
    let firstF1Date: String?
    let organizationType: String?
    let committeeTypeFull, name: String?
    let partyFull: String?
    let designationFull: String?

    enum CodingKeys: String, CodingKey {
        case cycles
        case firstFileDate = "first_file_date"
        case state
        case filingFrequency = "filing_frequency"
        case affiliatedCommitteeName = "affiliated_committee_name"
        case committeeType = "committee_type"
        case designation
        case lastF1Date = "last_f1_date"
        case organizationTypeFull = "organization_type_full"
        case party
        case lastFileDate = "last_file_date"
        case committeeID = "committee_id"
        case treasurerName = "treasurer_name"
        case candidateIDS = "candidate_ids"
        case firstF1Date = "first_f1_date"
        case organizationType = "organization_type"
        case committeeTypeFull = "committee_type_full"
        case name
        case partyFull = "party_full"
        case designationFull = "designation_full"
    }
}


struct CandidateDetails: Codable {
    let addressStreet2: String?
    let electionYears: [Int]?
    let candidateStatus: String?
    let candidateInactive: Bool?
    let officeFull, addressState, addressStreet1, office: String?
    let lastFileDate: String?
    let electionDistricts: [String?]?
    let incumbentChallengeFull: String?
    let cycles: [Int]?
    let federalFundsFlag: Bool?
    let flags, partyFull: String?
    let districtNumber: Int?
    let name, firstFileDate, district: String?
    let hasRaisedFunds: Bool?
    let party, addressCity, lastF2Date, addressZip: String?
    let candidateID: String?
    let loadDate: String?
    let activeThrough: Int?
    let state: String?
    let incumbentChallenge: String?

    enum CodingKeys: String, CodingKey {
        case addressStreet2 = "address_street_2"
        case electionYears = "election_years"
        case candidateStatus = "candidate_status"
        case candidateInactive = "candidate_inactive"
        case officeFull = "office_full"
        case addressState = "address_state"
        case addressStreet1 = "address_street_1"
        case office
        case lastFileDate = "last_file_date"
        case electionDistricts = "election_districts"
        case incumbentChallengeFull = "incumbent_challenge_full"
        case cycles
        case federalFundsFlag = "federal_funds_flag"
        case flags
        case partyFull = "party_full"
        case districtNumber = "district_number"
        case name
        case firstFileDate = "first_file_date"
        case district
        case hasRaisedFunds = "has_raised_funds"
        case party
        case addressCity = "address_city"
        case lastF2Date = "last_f2_date"
        case addressZip = "address_zip"
        case candidateID = "candidate_id"
        case loadDate = "load_date"
        case activeThrough = "active_through"
        case state
        case incumbentChallenge = "incumbent_challenge"
    }
}

