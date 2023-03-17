//
//  Movie.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 15.03.2023.
//

import Foundation

struct Movie: Codable {
//    let page: Int?
    var results: [MovieResult]?
//    let totalPages: Int?
//    let totalResults: Int?
//                   --------------------  CodingKeys enum kullanma amacı apı den veri çekerken apıdeki isme bağlı kalmak istemiyorsak enum                                                                   içerisinde apı deki ismini yazmamız gerekiyor
//    enum CodingKeys: String, CodingKey{
//        case page
//        case results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
}

struct MovieResult: Codable {
    var id: Int?
    var posterPath: String?
    var overview, releaseDate, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
    
    var _title: String {
        title ?? "There is no title"
    }
    
    var _releaseDate: String {
        releaseDate ?? "There is no date"
    }
    
    var _overview: String {
        overview ?? "There is no overview"
    }
}
