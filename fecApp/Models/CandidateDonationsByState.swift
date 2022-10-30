struct CandidateDonationsByState: Codable {
    let state: String?
    let total: Double?
    let count: Int?
    let candidateID: String?
    let cycle: Int?
    let stateFull: String?

    enum CodingKeys: String, CodingKey {
        case state, total, count
        case candidateID = "candidate_id"
        case cycle
        case stateFull = "state_full"
    }
}
