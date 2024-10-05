//
//  TMDbAPIClient.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

import Foundation

class TMDbAPIClient {
    private let apiKey = "YOUR_TMDB_API_KEY"
    private let baseURL = "https://api.themoviedb.org/3"

    func fetchMovies(endpoint: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/movie/\(endpoint)?api_key=\(apiKey)")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }

            do {
                // Decode response into `MovieResponse` struct
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))  // Return movie array from results
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchMovieDetails(id: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/movie/\(id)?api_key=\(apiKey)")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }

            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                completion(.success(movie))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

