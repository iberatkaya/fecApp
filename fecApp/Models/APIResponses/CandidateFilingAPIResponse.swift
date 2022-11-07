// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CandidateFilingAPIResponse: Codable {
    let apiVersion: String?
    let pagination: CandidateFilingAPIPagination?
    let results: [CandidateFiling]?

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case pagination, results
    }
}

// MARK: - Pagination
struct CandidateFilingAPIPagination: Codable {
    let count, perPage, pages, page: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case perPage = "per_page"
        case pages, page
    }
}
