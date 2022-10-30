import Foundation

// MARK: - Welcome
struct CandidateDonationsByStateAPIResponse: Codable {
    let apiVersion: String?
    let pagination: CandidateDonationsByStateAPIResponsePagination?
    let results: [CandidateDonationsByState]?

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case pagination, results
    }
}

// MARK: - Pagination
struct CandidateDonationsByStateAPIResponsePagination: Codable {
    let page, perPage, count, pages: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case count, pages
    }
}
