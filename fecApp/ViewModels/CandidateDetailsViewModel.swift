class CandidateDetailsViewModel {
    var candidate: CandidateDetails?
    var financials: [CandidateFinancials]?
    var donationsByState: [CandidateDontaionsByState]?
    var candidateFetchingStatus = APIFetchingStatus.idle
    var financialFetchingStatus = APIFetchingStatus.idle
    var donationsByStateStatus = APIFetchingStatus.idle
    
    private let apiService = FECApi()
    
    func getCandidate(_ id: String) async {
        candidateFetchingStatus = .loading
        financialFetchingStatus = .loading
        async let candidateRes = apiService.getCandidate(id)
        async let financialsRes = apiService.getCandidateFinancials(id)
        
        let res = await (candidateRes, financialsRes)
        
        switch res.0 {
        case .success(let c):
            candidate = c
            candidateFetchingStatus = .success
        case .failure(_):
            candidateFetchingStatus = .failed
        }
        switch res.1 {
        case .success(let c):
            financials = c
            financialFetchingStatus = .success
        case .failure(_):
            financialFetchingStatus = .failed
        }
        
        if let electionYears = candidate?.electionYears {
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
    
    func getCandidateDonationsByYear(year: Int) -> [CandidateDontaionsByState] {
        return donationsByState?.filter({ donation in
            return donation.cycle == year
        }) ?? []
    }
    
    func getValidDonationYears() -> [Int] {
        var dates: [Int] = []
        for d in (donationsByState ?? []) {
            if let cycle = d.cycle, !dates.contains(cycle) {
                dates.append(cycle)
            }
        }
        
        return dates.sorted { $0 > $1 }
    }
}
