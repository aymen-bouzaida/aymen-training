//
//  MoviesService.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import Foundation


protocol MoviesServiceProtocol{
    func getMovies(completion: @escaping (Bool, [Movie]?, String?) -> ())
}

class MoviesService: MoviesServiceProtocol{
   
    func getMovies(completion: @escaping (Bool, [Movie]?, String?) -> ()){
        
    }
}
