//
//  Movie.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import Foundation

struct Movie: Codable{
 
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    let backdropPath: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
