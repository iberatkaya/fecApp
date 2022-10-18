// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CandidatesSearchAPIResponse: Codable {
    let apiVersion: String
    let pagination: Pagination
    let results: [Candidate]

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case pagination, results
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let page, count, pages, perPage: Int

    enum CodingKeys: String, CodingKey {
        case page, count, pages
        case perPage = "per_page"
    }
}

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
    let cycles: [Int]
    let firstFileDate, state, filingFrequency: String
    let affiliatedCommitteeName: String?
    let committeeType, designation, lastF1Date: String
    let organizationTypeFull: JSONNull?
    let party: String?
    let lastFileDate, committeeID, treasurerName: String
    let candidateIDS: [String]
    let firstF1Date: String
    let organizationType: JSONNull?
    let committeeTypeFull, name: String
    let partyFull: String?
    let designationFull: String

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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
