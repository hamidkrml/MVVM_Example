// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: jsonData)

import Foundation
struct MovieResponse: Decodable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let results: [Movie]?

    struct Movie: Decodable {
        let id: Int
        let title: String
    }

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}
