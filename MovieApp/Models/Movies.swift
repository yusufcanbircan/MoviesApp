//
//  Movies.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 2.02.2023.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieResult: Codable {
    let id: Int?
    let originalLanguage, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
    }
}
