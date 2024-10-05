//
//  MovieListViewController.swift
//  Moviebanquemisr.challenge05
//
//  Created by mervat on 05/10/2024.
//

import UIKit

class MovieListViewController: UIViewController {
    public let viewModel: MovieListViewModel
    public let tableView = UITableView()

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()

        viewModel.fetchNowPlayingMovies() // Example: Start with now playing movies
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func setupBindings() {
        viewModel.onMoviesFetched = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.onError = { error in
            print("Error fetching movies: \(error)")
        }
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let movie = viewModel.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        let detailVC = MovieDetailViewController(movieId: movie.id, movieRepository: viewModel.movieRepository)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

