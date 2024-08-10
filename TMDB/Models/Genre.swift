//
//  Genre.swift
//  TMDB
//
//  Created by Gautham C on 7/23/24.
//

import Foundation

struct GenreData : Decodable {
    let genres : [Genre]
}

struct Genre : Identifiable, Decodable {
    let id: Int
    let name : String
}
