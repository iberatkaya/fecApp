//
//  CandidateFiling.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 11/6/22.
//

import Foundation

struct CandidateFiling: Codable {
    let bankDepositoryName: JSONNull?
    let mostRecent: Bool?
    let primaryGeneralIndicator: JSONNull?
    let documentDescription: String?
    let senatePersonalFunds: JSONNull?
    let subID: String?
    let bankDepositoryStreet1: JSONNull?
    let updateDate: String?
    let coverageEndDate: JSONNull?
    let formType: String?
    let coverageStartDate: JSONNull?
    let amendmentVersion: Int?
    let pdfURL: String?
    let committeeType, bankDepositoryStreet2, bankDepositoryState, netDonations: JSONNull?
    let candidateName: String?
    let meansFiled: String?
    let debtsOwedByCommittee, totalDisbursements: JSONNull?
    let previousFileNumber, fileNumber: Int?
    let bankDepositoryCity: JSONNull?
    let fecURL: String?
    let beginningImageNumber: String?
    let documentType, totalReceipts: JSONNull?
    let isAmended: Bool?
    let totalIndependentExpenditures: JSONNull?
    let reportYear: Int?
    let totalIndividualContributions: JSONNull?
    let receiptDate: String?
    let amendmentChain: [Int]?
    let debtsOwedToCommittee, requestType: JSONNull?
    let candidateID: String?
    let pages: Int?
    let totalCommunicationCost: JSONNull?
    let formCategory: String?
    let additionalBankNames, oppositionPersonalFunds, housePersonalFunds: JSONNull?
    let endingImageNumber: String?
    let cashOnHandBeginningPeriod: JSONNull?
    let htmlURL: String?
    let office: String?
    let electionYear: Int?
    let committeeID: String?
    let state: String?
    let bankDepositoryZip: JSONNull?
    let party: String?
    let csvURL: String?
    let treasurerName: String?
    let committeeName, reportType: JSONNull?
    let amendmentIndicator: String?
    let cashOnHandEndPeriod, documentTypeFull: JSONNull?
    let cycle: Int?
    let mostRecentFileNumber: Int?
    let fecFileID: String?
    let reportTypeFull: JSONNull?

   
    enum CodingKeys: String, CodingKey {
        case bankDepositoryName = "bank_depository_name"
        case mostRecent = "most_recent"
        case primaryGeneralIndicator = "primary_general_indicator"
        case documentDescription = "document_description"
        case senatePersonalFunds = "senate_personal_funds"
        case subID = "sub_id"
        case bankDepositoryStreet1 = "bank_depository_street_1"
        case updateDate = "update_date"
        case coverageEndDate = "coverage_end_date"
        case formType = "form_type"
        case coverageStartDate = "coverage_start_date"
        case amendmentVersion = "amendment_version"
        case pdfURL = "pdf_url"
        case committeeType = "committee_type"
        case bankDepositoryStreet2 = "bank_depository_street_2"
        case bankDepositoryState = "bank_depository_state"
        case netDonations = "net_donations"
        case candidateName = "candidate_name"
        case meansFiled = "means_filed"
        case debtsOwedByCommittee = "debts_owed_by_committee"
        case totalDisbursements = "total_disbursements"
        case previousFileNumber = "previous_file_number"
        case fileNumber = "file_number"
        case bankDepositoryCity = "bank_depository_city"
        case fecURL = "fec_url"
        case beginningImageNumber = "beginning_image_number"
        case documentType = "document_type"
        case totalReceipts = "total_receipts"
        case isAmended = "is_amended"
        case totalIndependentExpenditures = "total_independent_expenditures"
        case reportYear = "report_year"
        case totalIndividualContributions = "total_individual_contributions"
        case receiptDate = "receipt_date"
        case amendmentChain = "amendment_chain"
        case debtsOwedToCommittee = "debts_owed_to_committee"
        case requestType = "request_type"
        case candidateID = "candidate_id"
        case pages
        case totalCommunicationCost = "total_communication_cost"
        case formCategory = "form_category"
        case additionalBankNames = "additional_bank_names"
        case oppositionPersonalFunds = "opposition_personal_funds"
        case housePersonalFunds = "house_personal_funds"
        case endingImageNumber = "ending_image_number"
        case cashOnHandBeginningPeriod = "cash_on_hand_beginning_period"
        case htmlURL = "html_url"
        case office
        case electionYear = "election_year"
        case committeeID = "committee_id"
        case state
        case bankDepositoryZip = "bank_depository_zip"
        case party
        case csvURL = "csv_url"
        case treasurerName = "treasurer_name"
        case committeeName = "committee_name"
        case reportType = "report_type"
        case amendmentIndicator = "amendment_indicator"
        case cashOnHandEndPeriod = "cash_on_hand_end_period"
        case documentTypeFull = "document_type_full"
        case cycle
        case mostRecentFileNumber = "most_recent_file_number"
        case fecFileID = "fec_file_id"
        case reportTypeFull = "report_type_full"
    }
}
