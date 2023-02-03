//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 2.02.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) -> URLSessionDataTask {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = urlResponse as? HTTPURLResponse,
                  response.statusCode == 200
            else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data
            else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            completion(.success(data))
        }; dataTask.resume()
        
        return dataTask
    }
}
