// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CandidateDetailsAPIResponse: Codable {
    let apiVersion: String
    let results: [CandidateDetails]
    let pagination: CandidateDetailsAPIResponsePagination

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case results, pagination
    }
}

// MARK: - Pagination
struct CandidateDetailsAPIResponsePagination: Codable {
    let page, pages, perPage, count: Int

    enum CodingKeys: String, CodingKey {
        case page, pages
        case perPage = "per_page"
        case count
    }
}
