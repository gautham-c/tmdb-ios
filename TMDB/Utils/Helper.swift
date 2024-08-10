//
//  Helper.swift
//  TMDB
//
//  Created by Gautham C on 8/9/24.
//

import Foundation

struct Helper {
    
    static func getGenreNames(for ids: [Int], genreList : [Genre]) -> [String] {
        var genreNames : [String] = []
        for id in ids {
            for genre in genreList {
                if id == genre.id {
                    genreNames.append(genre.name)
                }
            }
        }
        return genreNames
    }
    
}
