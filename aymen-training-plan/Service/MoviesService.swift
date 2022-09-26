//
//  MoviesService.swift
//  aymen-training-plan
//
//  Created by aymen bouzaida on 19/09/2022.
//

import Foundation
import Alamofire
import RxSwift
import UIKit

protocol MoviesServiceProtocol{
    func getMovies() -> Observable<[Movie]>
}

enum RequestError: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

class MoviesService: MoviesServiceProtocol{
   
    private let baseUrlString = "https://api.themoviedb.org"
    private let popularMoviesPath = "/3/movie/popular"
    static let imageBasePAth = "https://image.tmdb.org/t/p/w500"
    //
    func getMoviesX(completion: @escaping (Bool, [Movie]?, String?) -> Void){
        let url = baseUrlString + popularMoviesPath
        let parameters = ["api_key": "f2f3b2735f463e4d935ad069bd331926"]
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success:
                do {
                    let moviePager = try JSONDecoder().decode(MoviePager.self, from: response.data!)
                    print(moviePager)
                    completion(true, moviePager.movies, nil)
                } catch let error as NSError {
                    
                    print("Failed to load: \(error.localizedDescription)")
                }
            case .failure(let error):
                
                print("Request error: \(error.localizedDescription)")
            }
        }
    }

    func getMovies() -> Observable<[Movie]> {
        let url = baseUrlString + popularMoviesPath
        let parameters = ["api_key": "f2f3b2735f463e4d935ad069bd331926"]
        return Observable.create { observer -> Disposable in
            AF.request(url, method: .get, parameters: parameters).responseData { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? RequestError.notFound)
                            return
                        }
                        do {
                            let moviePager = try JSONDecoder().decode(MoviePager.self, from: data)
                            observer.onNext(moviePager.movies)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = RequestError(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
    }
}
