import Foundation

// MARK: - Welcome
struct CandidateFinancialsAPIResponse: Codable {
    let pagination: CandidateFinancialsAPIResponsePagination
    let results: [CandidateFinancials]
}

// MARK: - Pagination
struct CandidateFinancialsAPIResponsePagination: Codable {
    let count, page, pages, perPage: Int

    enum CodingKeys: String, CodingKey {
        case count, page, pages
        case perPage = "per_page"
    }
}
