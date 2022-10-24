class CandidateDetailsViewModel {
    var candidate: CandidateDetails?
    var financials: [CandidateFinancials]?
    var candidateFetchingStatus = APIFetchingStatus.idle
    var financialFetchingStatus = APIFetchingStatus.idle
    
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
    }
}
