//
//  MovieRepository.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

protocol MovieRepository {
    func fetchNowPlaying(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchPopular(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchUpcoming(completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchMovieDetails(id: Int, completion: @escaping (Result<Movie, Error>) -> Void)
}
