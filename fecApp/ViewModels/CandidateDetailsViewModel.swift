class CandidateDetailsViewModel {
    var candidate: CandidateDetails?
    var donationsByState: [CandidateDonationsByState]?
    var candidateFetchingStatus = APIFetchingStatus.idle
    var donationsByStateStatus = APIFetchingStatus.idle
    
    private let apiService = FECApi()
    
    func getCandidate(_ id: String) async {
        candidateFetchingStatus = .loading
        async let candidateRes = apiService.getCandidate(id)
        
        let res = await candidateRes
        
        switch res {
        case .success(let c):
            candidate = c
            candidateFetchingStatus = .success
        case .failure(_):
            candidateFetchingStatus = .failed
        }
        
        if let electionYears = candidate?.electionYears {
            donationsByStateStatus = .loading
            let donationsByStateRes = await apiService.getDonationsByState(candidateID: id, cycles: electionYears)
            switch donationsByStateRes {
            case .success(let c):
                donationsByState = c
                donationsByStateStatus = .success
            case .failure(_):
                donationsByStateStatus = .failed
            }
        } else {
            donationsByStateStatus = .success
        }
    }
    
    func getCandidateDonationsByYear(year: Int) -> [CandidateDonationsByState] {
        return donationsByState?.filter({ donation in
            return donation.cycle == year
        }) ?? []
    }
    
    func getValidDonationYears() -> [Int] {
        return fecApp.getValidDonationYears(donationsByState: donationsByState ?? [])
    }
}
