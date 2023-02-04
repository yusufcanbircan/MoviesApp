//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 3.02.2023.
//

import Foundation

protocol HomeViewModelInterfaceProtocol {
    var view: HomeViewInterfaceProtocol? { get set }
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeViewInterfaceProtocol?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page: Int = 1
}

extension HomeViewModel: HomeViewModelInterfaceProtocol {
    func viewDidLoad() {
        view?.configureView()
        view?.configureCollectionView()
        
        self.getMovies()
    }
    
    func getMovies() {
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self, let returnedMovies = returnedMovies else { return }
            
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedDetail in
            guard let self = self, let returnedDetail = returnedDetail else { return }
            
            self.view?.navigateToDetailViewController(movie: returnedDetail)
        }
    }
}
