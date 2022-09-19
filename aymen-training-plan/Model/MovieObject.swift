//
//  Movie.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import Foundation

struct Movie: Codable{
 
    let id: String

    enum CodingKeys: String, CodingKey {
        case id
    }
    
}
