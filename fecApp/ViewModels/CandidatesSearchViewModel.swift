class CandidatesSearchViewModel {
    var candidates: [Candidate] = []
    
    let apiService = FECApi()
    
    func searchForCandidate(_ name: String) async {
        let res = await apiService.searchCandidate(name)
        
        switch res {
        case .success(let c):
            candidates = c
        case .failure(_):
            candidates = []
        }
    }
}
