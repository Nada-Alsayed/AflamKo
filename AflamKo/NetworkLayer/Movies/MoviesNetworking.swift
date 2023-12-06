//
//  MoviesNetworking.swift
//  AflamKo
//
//  Created by MAC on 05/12/2023.
//

import Foundation

enum MoviesNetworking{
    case getMovies
}

extension MoviesNetworking : TargetType{
    var baseURL: String {
        switch self{
        case .getMovies:
           return "https://imdb-top-100-movies.p.rapidapi.com"
        }
    }
    
    var endPoint: String {
        switch self{
        case .getMovies:
            return ""
        }
    }
    
    var task: Task {
        switch self{
        case .getMovies:
            return .requestPlain
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self{
        case .getMovies:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .getMovies:
            return ["X-RapidAPI-Key" : "ef7bce6c0cmshd99bf9413144436p1b62a8jsn8729763ae729","X-RapidAPI-Host":"imdb-top-100-movies.p.rapidapi.com"]
        }
    }
    
}
