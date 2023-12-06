//
//  HomeCellViewModel.swift
//  AflamKo
//
//  Created by MAC on 06/12/2023.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: String
    var title: String
    var rate: String
    var year: String
    var image: URL?
    
    init(movie: Movie) {
        self.id = movie.id ?? "000"
        self.title = movie.title ?? "Title"
        self.rate = movie.rating ?? "0.0"
        self.year = "\(movie.year ?? 0000)"
        self.image = makeImageURL(image: movie.thumbnail ?? "")
    }
    
    private func makeImageURL(image: String) -> URL? {
        URL(string: image)
    }
}
