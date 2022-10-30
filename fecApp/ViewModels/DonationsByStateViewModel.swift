class DonationsByStateViewModel {
    let candidate: CandidateDetails
    let donationsByState: [CandidateDonationsByState]
    
    init(candidate: CandidateDetails, donationsByState: [CandidateDonationsByState]) {
        self.candidate = candidate
        self.donationsByState = donationsByState
    }
}
