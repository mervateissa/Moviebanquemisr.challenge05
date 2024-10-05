//
//  Movie.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

struct Movie: Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String?
    let overview: String?
    
    // You can ignore these if not needed, otherwise define them appropriately
    let genres: [Genre]?
    let runtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview, runtime, genres
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}

