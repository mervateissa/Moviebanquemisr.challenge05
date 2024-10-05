//
//  MovieListViewModel.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

import Foundation

class MovieListViewModel {
    public let movieRepository: MovieRepository
    var movies: [Movie] = []

    var onMoviesFetched: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func fetchNowPlayingMovies() {
        movieRepository.fetchNowPlaying { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.onMoviesFetched?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }

    func fetchPopularMovies() {
        movieRepository.fetchPopular { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.onMoviesFetched?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }

    func fetchUpcomingMovies() {
        movieRepository.fetchUpcoming { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.onMoviesFetched?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}

class MovieDetailViewModel {
    private let movieRepository: MovieRepository
    var movie: Movie?
    
    var onMovieFetched: (() -> Void)?
    var onError: ((Error) -> Void)?

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func fetchMovieDetails(id: Int) {
        movieRepository.fetchMovieDetails(id: id) { [weak self] result in
            switch result {
            case .success(let movie):
                self?.movie = movie
                self?.onMovieFetched?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}

