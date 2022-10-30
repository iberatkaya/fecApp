import Foundation

// MARK: - Welcome
struct CandidateDontaionsByStateAPIResponse: Codable {
    let apiVersion: String?
    let pagination: CandidateDontaionsByStateAPIResponsePagination?
    let results: [CandidateDontaionsByState]?

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case pagination, results
    }
}

// MARK: - Pagination
struct CandidateDontaionsByStateAPIResponsePagination: Codable {
    let page, perPage, count, pages: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case count, pages
    }
}
