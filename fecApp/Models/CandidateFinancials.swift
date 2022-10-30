//
//  CandidateFinancials.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 10/23/22.
//

import Foundation

struct CandidateFinancials: Codable {
    let allLoansReceived, allOtherLoans, allocatedFederalElectionLevinShare, candidateContribution: Double?
    let cashOnHandBeginningPeriod: Double?
    let committeeDesignation, committeeDesignationFull, committeeID, committeeName: String?
    let committeeState, committeeType, committeeTypeFull: String?
    let contributionsIeAndPartyExpendituresMadePercent, conventionExp: Double?
    let coordinatedExpendituresByPartyCommittee: Double?
    let coverageEndDate, coverageStartDate: String?
    let cycle, exemptLegalAccountingDisbursement, expPriorYearsSubjectLimits: Double?
    let expSubjectLimits, fedCandidateCommitteeContributions, fedCandidateContributionRefunds, fedDisbursements: Double?
    let fedElectionActivity, fedOperatingExpenditures, fedReceipts, federalFunds: Double?
    let filingFrequency, filingFrequencyFull, firstF1Date, firstFileDate: String?
    let fundraisingDisbursements, independentExpenditures, individualContributionsPercent: Double?
    let individualItemizedContributions, individualUnitemizedContributions, itemizedConventionExp, itemizedOtherDisb: Double?
    let itemizedOtherIncome, itemizedOtherRefunds, itemizedRefundsRelatingConventionExp: Double?
    let lastBeginningImageNumber: String?
    let lastDebtsOwedToCommittee: Double?
    let lastReportTypeFull: String?
    let lastReportYear, loanRepayments, loanRepaymentsCandidateLoans, loanRepaymentsMade: Double?
    let loanRepaymentsOtherLoans, loanRepaymentsReceived, loans, loansAndLoanRepaymentsMade: Double?
    let loansAndLoanRepaymentsReceived, loansMade, loansMadeByCandidate, loansReceived: Double?
    let loansReceivedFromCandidate, nonAllocatedFedElectionActivity: Double?
    let offsetsToFundraisingExpenditures, offsetsToLegalAccounting: Double?
    let operatingExpendituresPercent: Double?
    let organizationType, organizationTypeFull: String?
    let otherDisbursements, otherFedOperatingExpenditures, otherFedReceipts, otherLoansReceived: Double?
    let otherRefunds, partyAndOtherCommitteeContributionsPercent: Double?
    let partyFull, pdfURL: String?
    let politicalPartyCommitteeContributions, refundedOtherPoliticalCommitteeContributions: Double?
    let refundedPoliticalPartyCommitteeContributions, refundsRelatingConventionExp, repaymentsLoansMadeByCandidate, repaymentsOtherLoans: Double?
    let reportForm: String?
    let sharedFedActivity, sharedFedActivityNonfed, sharedFedOperatingExpenditures, sharedNonfedOperatingExpenditures: Double?
    let totalExpSubjectLimits, totalIndependentContributions, totalIndependentExpenditures: Double?
    let totalTransfers: Double?
    let transactionCoverageDate: String?
    let transfersFromAffiliatedCommittee, transfersFromAffiliatedParty, transfersFromNonfedAccount, transfersFromNonfedLevin: Double?
    let transfersFromOtherAuthorizedCommittee, transfersToAffiliatedCommittee, transfersToOtherAuthorizedCommittee: Double?
    let treasurerName: String?
    let unitemizedConventionExp, unitemizedOtherDisb, unitemizedOtherIncome, unitemizedOtherRefunds: Double?
    let unitemizedRefundsRelatingConventionExp: Double?
    let otherPoliticalCommitteeContributions: Double?
    let contributionRefunds, refundedIndividualContributions: Double?
    let lastCashOnHandEndPeriod, netContributions, disbursements: Double?
    let operatingExpenditures, receipts: Double?
    let netOperatingExpenditures: Double?
    let lastDebtsOwedByCommittee: Double?
    let contributions: Double?
    let totalOffsetsToOperatingExpenditures: Double?
    let individualContributions, otherReceipts, offsetsToOperatingExpenditures: Double?

    enum CodingKeys: String, CodingKey {
        case allLoansReceived = "all_loans_received"
        case allOtherLoans = "all_other_loans"
        case allocatedFederalElectionLevinShare = "allocated_federal_election_levin_share"
        case candidateContribution = "candidate_contribution"
        case cashOnHandBeginningPeriod = "cash_on_hand_beginning_period"
        case committeeDesignation = "committee_designation"
        case committeeDesignationFull = "committee_designation_full"
        case committeeID = "committee_id"
        case committeeName = "committee_name"
        case committeeState = "committee_state"
        case committeeType = "committee_type"
        case committeeTypeFull = "committee_type_full"
        case contributionRefunds = "contribution_refunds"
        case contributions
        case contributionsIeAndPartyExpendituresMadePercent = "contributions_ie_and_party_expenditures_made_percent"
        case conventionExp = "convention_exp"
        case coordinatedExpendituresByPartyCommittee = "coordinated_expenditures_by_party_committee"
        case coverageEndDate = "coverage_end_date"
        case coverageStartDate = "coverage_start_date"
        case cycle, disbursements
        case exemptLegalAccountingDisbursement = "exempt_legal_accounting_disbursement"
        case expPriorYearsSubjectLimits = "exp_prior_years_subject_limits"
        case expSubjectLimits = "exp_subject_limits"
        case fedCandidateCommitteeContributions = "fed_candidate_committee_contributions"
        case fedCandidateContributionRefunds = "fed_candidate_contribution_refunds"
        case fedDisbursements = "fed_disbursements"
        case fedElectionActivity = "fed_election_activity"
        case fedOperatingExpenditures = "fed_operating_expenditures"
        case fedReceipts = "fed_receipts"
        case federalFunds = "federal_funds"
        case filingFrequency = "filing_frequency"
        case filingFrequencyFull = "filing_frequency_full"
        case firstF1Date = "first_f1_date"
        case firstFileDate = "first_file_date"
        case fundraisingDisbursements = "fundraising_disbursements"
        case independentExpenditures = "independent_expenditures"
        case individualContributions = "individual_contributions"
        case individualContributionsPercent = "individual_contributions_percent"
        case individualItemizedContributions = "individual_itemized_contributions"
        case individualUnitemizedContributions = "individual_unitemized_contributions"
        case itemizedConventionExp = "itemized_convention_exp"
        case itemizedOtherDisb = "itemized_other_disb"
        case itemizedOtherIncome = "itemized_other_income"
        case itemizedOtherRefunds = "itemized_other_refunds"
        case itemizedRefundsRelatingConventionExp = "itemized_refunds_relating_convention_exp"
        case lastBeginningImageNumber = "last_beginning_image_number"
        case lastCashOnHandEndPeriod = "last_cash_on_hand_end_period"
        case lastDebtsOwedByCommittee = "last_debts_owed_by_committee"
        case lastDebtsOwedToCommittee = "last_debts_owed_to_committee"
        case lastReportTypeFull = "last_report_type_full"
        case lastReportYear = "last_report_year"
        case loanRepayments = "loan_repayments"
        case loanRepaymentsCandidateLoans = "loan_repayments_candidate_loans"
        case loanRepaymentsMade = "loan_repayments_made"
        case loanRepaymentsOtherLoans = "loan_repayments_other_loans"
        case loanRepaymentsReceived = "loan_repayments_received"
        case loans
        case loansAndLoanRepaymentsMade = "loans_and_loan_repayments_made"
        case loansAndLoanRepaymentsReceived = "loans_and_loan_repayments_received"
        case loansMade = "loans_made"
        case loansMadeByCandidate = "loans_made_by_candidate"
        case loansReceived = "loans_received"
        case loansReceivedFromCandidate = "loans_received_from_candidate"
        case netContributions = "net_contributions"
        case netOperatingExpenditures = "net_operating_expenditures"
        case nonAllocatedFedElectionActivity = "non_allocated_fed_election_activity"
        case offsetsToFundraisingExpenditures = "offsets_to_fundraising_expenditures"
        case offsetsToLegalAccounting = "offsets_to_legal_accounting"
        case offsetsToOperatingExpenditures = "offsets_to_operating_expenditures"
        case operatingExpenditures = "operating_expenditures"
        case operatingExpendituresPercent = "operating_expenditures_percent"
        case organizationType = "organization_type"
        case organizationTypeFull = "organization_type_full"
        case otherDisbursements = "other_disbursements"
        case otherFedOperatingExpenditures = "other_fed_operating_expenditures"
        case otherFedReceipts = "other_fed_receipts"
        case otherLoansReceived = "other_loans_received"
        case otherPoliticalCommitteeContributions = "other_political_committee_contributions"
        case otherReceipts = "other_receipts"
        case otherRefunds = "other_refunds"
        case partyAndOtherCommitteeContributionsPercent = "party_and_other_committee_contributions_percent"
        case partyFull = "party_full"
        case pdfURL = "pdf_url"
        case politicalPartyCommitteeContributions = "political_party_committee_contributions"
        case receipts
        case refundedIndividualContributions = "refunded_individual_contributions"
        case refundedOtherPoliticalCommitteeContributions = "refunded_other_political_committee_contributions"
        case refundedPoliticalPartyCommitteeContributions = "refunded_political_party_committee_contributions"
        case refundsRelatingConventionExp = "refunds_relating_convention_exp"
        case repaymentsLoansMadeByCandidate = "repayments_loans_made_by_candidate"
        case repaymentsOtherLoans = "repayments_other_loans"
        case reportForm = "report_form"
        case sharedFedActivity = "shared_fed_activity"
        case sharedFedActivityNonfed = "shared_fed_activity_nonfed"
        case sharedFedOperatingExpenditures = "shared_fed_operating_expenditures"
        case sharedNonfedOperatingExpenditures = "shared_nonfed_operating_expenditures"
        case totalExpSubjectLimits = "total_exp_subject_limits"
        case totalIndependentContributions = "total_independent_contributions"
        case totalIndependentExpenditures = "total_independent_expenditures"
        case totalOffsetsToOperatingExpenditures = "total_offsets_to_operating_expenditures"
        case totalTransfers = "total_transfers"
        case transactionCoverageDate = "transaction_coverage_date"
        case transfersFromAffiliatedCommittee = "transfers_from_affiliated_committee"
        case transfersFromAffiliatedParty = "transfers_from_affiliated_party"
        case transfersFromNonfedAccount = "transfers_from_nonfed_account"
        case transfersFromNonfedLevin = "transfers_from_nonfed_levin"
        case transfersFromOtherAuthorizedCommittee = "transfers_from_other_authorized_committee"
        case transfersToAffiliatedCommittee = "transfers_to_affiliated_committee"
        case transfersToOtherAuthorizedCommittee = "transfers_to_other_authorized_committee"
        case treasurerName = "treasurer_name"
        case unitemizedConventionExp = "unitemized_convention_exp"
        case unitemizedOtherDisb = "unitemized_other_disb"
        case unitemizedOtherIncome = "unitemized_other_income"
        case unitemizedOtherRefunds = "unitemized_other_refunds"
        case unitemizedRefundsRelatingConventionExp = "unitemized_refunds_relating_convention_exp"
    }
}
