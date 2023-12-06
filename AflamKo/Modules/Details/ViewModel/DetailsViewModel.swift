//
//  DetailsViewModel.swift
//  AflamKo
//
//  Created by MAC on 06/12/2023.
//

import Foundation

class DetailsMovieViewModel {
    
    //MARK: - Variables

    var movieData: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    
    init(movie: Movie) {
        self.movieData = movie
        self.movieTitle = movie.title ?? movie.title ?? ""
        self.movieDescription = movie.description ?? ""
        self.movieImage = makeImageURL(image: movie.thumbnail ?? "")
    }
    
    private func makeImageURL(image: String) -> URL? {
        URL(string: image)
    }
}
