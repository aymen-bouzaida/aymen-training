//
//  MoviePager.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 21/09/2022.
//

import Foundation

struct MoviePager: Codable{
 
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case movies = "results"
    }
}
