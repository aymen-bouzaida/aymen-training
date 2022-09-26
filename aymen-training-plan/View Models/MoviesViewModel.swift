//
//  MoviesViewModel.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MoviesViewModel {
    
    private var moviesService: MoviesServiceProtocol!
    var movieCellViewModels: [MovieCellViewModel] = []
    // ...
    var disposeBag = DisposeBag()
    var movies: BehaviorRelay<[MovieCellViewModel]> = BehaviorRelay(value: [])

    init(moviesService: MoviesServiceProtocol = MoviesService()) {
        self.moviesService = moviesService
    }
    
    func getMovies() {
        moviesService.getMovies().subscribe { movies in
            var cellViewModels = [MovieCellViewModel]()
            for item in movies{
                let cellVM = self.createCellViewModel(movie: item)
                cellViewModels.append(cellVM)
            }
            self.movies.accept(cellViewModels)
        } onError: { error in
            print("Error occured:", error)
        }.disposed(by: disposeBag)
    }
  
    func getCellViewModel(index: IndexPath) -> MovieCellViewModel{
        return movieCellViewModels[index.row]
    }
                
    func createCellViewModel(movie: Movie) -> MovieCellViewModel{
        let cvm = MovieCellViewModel(imageFullPath: MoviesService.imageBasePAth + movie.posterPath, title: movie.originalTitle, description: movie.overview)
        return cvm
    }
}
