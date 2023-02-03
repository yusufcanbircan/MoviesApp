//
//  NetworkConstants.swift
//  MovieApp
//
//  Created by Yusuf Can Bircan on 2.02.2023.
//

import Foundation

enum NetworkConstants {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=7b400cff187082086146992ec3d11201&language=en-US&page=\(page)"
    }
    
    static func imageURL(path: String) -> String {
        "https://image.tmdb.org/t/p/w500\(path)"
    }
}

/*class NetworkConstants {
    public static var shared: NetworkConstants = NetworkConstants()
    private init() {}
    
    public var apiKey: String {
        get {
            return "7b400cff187082086146992ec3d11201"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/movie/popular?api_key="
        }
    }
    
    public var imageAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
*/
