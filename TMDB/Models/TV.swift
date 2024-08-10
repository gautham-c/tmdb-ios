//
//  TV.swift
//  TMDB
//
//  Created by Gautham C on 7/21/24.
//

import Foundation

struct TVData : Decodable {
    let results : [TV]
}

struct TV: Media {
    let id: Int
    let overview: String
    let original_language: String
    let backdrop_path: String
    let poster_path: String
    let vote_average: Double
    let genre_ids: [Int]
    let original_name: String
}
