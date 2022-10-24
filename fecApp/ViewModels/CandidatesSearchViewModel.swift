class CandidatesSearchViewModel {
    var status = APIFetchingStatus.idle
    var candidates: [Candidate] = []
    
    let apiService = FECApi()
    
    
    func resetData() {
        candidates = []
    }
    
    func searchForCandidate(_ name: String) async {
        candidates = []
        status = APIFetchingStatus.loading
        let res = await apiService.searchCandidate(name)
        
        switch res {
        case .success(let c):
            candidates = c
            status = APIFetchingStatus.success
        case .failure(_):
            candidates = []
            status = APIFetchingStatus.failed
        }
    }
}
