//
//  Movie.swift
//  AflamKo
//
//  Created by MAC on 04/12/2023.
//

import Foundation

struct Movie: Codable {
    
    let rank: Int?
    let title, description: String?
    let image, bigImage: String?
    let genre: [String]?
    let thumbnail: String?
    let rating, id: String?
    let year: Int?
    let imdbid: String?
    let imdbLink: String?

    enum CodingKeys: String, CodingKey {
        case rank, title, description, image
        case bigImage = "big_image"
        case genre, thumbnail, rating, id, year, imdbid
        case imdbLink = "imdb_link"
    }
}
