//
//  MovieDetailViewController.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

import UIKit

class MovieDetailViewController: UIViewController {
    private let viewModel: MovieDetailViewModel

    init(movieId: Int, movieRepository: MovieRepository) {
        self.viewModel = MovieDetailViewModel(movieRepository: movieRepository)
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchMovieDetails(id: movieId)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.onMovieFetched = { [weak self] in
            self?.title = self?.viewModel.movie?.title
            // Display movie details here
        }
        
        viewModel.onError = { error in
            print("Error fetching movie details: \(error)")
        }
    }
}
