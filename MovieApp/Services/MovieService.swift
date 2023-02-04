//
//  MovieService.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 2.02.2023.
//

import Foundation

final class MovieService {
    
    func downloadMovies(page: Int, completion: @escaping ([MovieResult]?) -> (Void)) {
        
        guard let url = URL(string: NetworkConstants.movies(page: page)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadDetail(id: Int, completion: @escaping (MovieResult?) -> (Void)) {
        
        guard let url = URL(string: NetworkConstants.detailURL(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
        
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movies.self, from: data)
            return movie.results
            
        } catch {
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> MovieResult? {
        do {
            
            let movieDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movieDetail
            
        } catch {
            return nil
        }
    }
}
