class DonationsByStateViewModel {
    let candidate: CandidateDetails
    let donationsByState: [CandidateDonationsByState]
    var filings: [CandidateFiling]?
    var failingsStatus = APIFetchingStatus.idle
    
    private let apiService = FECApi()
    
    init(candidate: CandidateDetails, donationsByState: [CandidateDonationsByState]) {
        self.candidate = candidate
        self.donationsByState = donationsByState
    }
    
    func fetchCandidateFilings() async {
        if let cycle = donationsByState.first?.cycle, let id = candidate.candidateID {
            let res = await apiService.getCandidateFilings(candidateID: id, cycles: [cycle])
            switch res {
            case .success(let c):
                filings = c
                failingsStatus = .success
            case .failure(_):
                failingsStatus = .failed
            }
        }
    }
}
