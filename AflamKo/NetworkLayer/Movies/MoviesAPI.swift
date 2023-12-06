//
//  MoviesAPI.swift
//  AflamKo
//
//  Created by MAC on 05/12/2023.
//

import Foundation


class MoviesAPI:BaseAPI<MoviesNetworking>{
    
    func getMovies(compelition :@escaping ([Movie]?)->()){
        self.fetchData(target: .getMovies, responseClass: [Movie].self) { movies, err in
            guard let movies = movies else { return  compelition(nil) }
            compelition(movies)
        }
    }
}
