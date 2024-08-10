//
//  Constants.swift
//  TMDB
//
//  Created by Gautham C on 7/16/24.
//

import Foundation

struct Constants {
    static let apiUrl = "https://api.themoviedb.org/3"
    static let apiKey = "2d1082f995d0f190ddcca4472f3cf45d"
    
    struct Url{
        static let popularTV = "/tv/popular"
        static let popularMovies = "/movie/popular"
        static let latestMovies = "/movie/now_playing"
        static let getMovieGenre = "/genre/movie/list"
        static let imageURL = "https://image.tmdb.org/t/p/original/"
        static let moviesForGenre = "/discover/movie"
    }
    
    struct Colors{
        static let skeptic = "Skeptic"
        static let zumthor = "Zumthor"
        static let gulfStream = "Gulf Stream"
        static let wedgewood = "Wedgewood"
    }
}
