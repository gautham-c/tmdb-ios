struct MoviesData : Decodable {
    let results : [Movie]
}

struct Movie: Media {
    let id: Int
    let overview: String
    let original_language: String
    let backdrop_path: String
    let poster_path: String
    let vote_average: Double
    let genre_ids: [Int]
    let original_title: String
}


