//
//  MoviesViewModel.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import Foundation

class MoviesViewModel: NSObject{
    
    private var moviesService: MoviesServiceProtocol!
  
    var Movies: [Movie] = []
    
    var reloadTableView: (() -> Void)?

    init(moviesService: MoviesServiceProtocol = MoviesService()) {
        self.moviesService = moviesService
    }
    
    
    func getMovies(){
    
      //  moviesService.getMovies
    }
}
