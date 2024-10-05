//
//  TMDbMovieRepository.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

class TMDbMovieRepository: MovieRepository {
    private let apiClient = TMDbAPIClient()
    
    func fetchNowPlaying(completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiClient.fetchMovies(endpoint: "now_playing", completion: completion)
    }

    func fetchPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiClient.fetchMovies(endpoint: "popular", completion: completion)
    }

    func fetchUpcoming(completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiClient.fetchMovies(endpoint: "upcoming", completion: completion)
    }

    func fetchMovieDetails(id: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        apiClient.fetchMovieDetails(id: id, completion: completion)
    }
}


