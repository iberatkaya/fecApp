// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CandidatesSearchAPIResponse: Codable {
    let apiVersion: String
    let pagination: CandidatesSearchAPIResponsePagination
    let results: [Candidate]

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case pagination, results
    }
}

// MARK: - Pagination
struct CandidatesSearchAPIResponsePagination: Codable {
    let page, count, pages, perPage: Int

    enum CodingKeys: String, CodingKey {
        case page, count, pages
        case perPage = "per_page"
    }
}
