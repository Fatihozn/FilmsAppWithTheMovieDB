//
//  APIURLs.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 15.03.2023.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func ımageUrl(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
}
