//
//  Media.swift
//  TMDB
//
//  Created by Gautham C on 7/21/24.
//

import Foundation

protocol Media: Identifiable, Decodable {
    var id: Int { get }
    var overview: String { get }
    var original_language: String { get }
    var backdrop_path: String { get }
    var poster_path: String { get }
    var vote_average: Double { get }
    var genre_ids: [Int] { get }
}
