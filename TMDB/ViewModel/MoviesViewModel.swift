//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Gautham C on 7/21/24.
//

import Foundation

class MoviesViewModel : ObservableObject {
    
    let network = NetworkServices()
    
    @Published private var popularMovieList : [Movie] = []
    @Published private var newMoviesList : [Movie] = []
    @Published private var allMoviesGenre: [Genre] = [
            Genre(id: -1, name: "New"),
            Genre(id: -2, name: "Popular")
        ]
    @Published private var movieListForGenre: [Int: [Movie]] = [:]
    
    func getPopularMovieList() -> [Movie] {
        return popularMovieList
    }
    
    func getNewMovieList() -> [Movie] {
        return newMoviesList
    }
    
    func getMoviesForGerneList(genreId: Int) -> [Movie] {
        if genreId == -1 {
            return newMoviesList
        } else if genreId == -2 {
            return popularMovieList
        }
        return movieListForGenre[genreId] ?? []
    }
    
    func getAllMovieGerneList() -> [Genre] {
        return allMoviesGenre
    }
    
    func getPopularMovies() async  {
            do{
                let movieData : MoviesData = try await network.fetchData(as: MoviesData.self, for: Constants.Url.popularMovies)
                DispatchQueue.main.async {
                    self.popularMovieList = movieData.results
                }
            } catch {
                print(error)
            }
    }
    
    func getNewMovies() async {
        do{
            let movieData : MoviesData = try await network.fetchData(as: MoviesData.self, for: Constants.Url.latestMovies)
            DispatchQueue.main.async {
                self.newMoviesList = movieData.results
            }
        } catch {
            print(error)
        }
    }
    
    func getAllMoviesGenre() async {
        do {
            let genreData : GenreData = try await network.fetchData(as: GenreData.self, for: Constants.Url.getMovieGenre)
            DispatchQueue.main.async {
                self.allMoviesGenre.append(contentsOf: genreData.genres)
            }
        } catch {
            print(error)
        }
    }
    
    func getMoviesForGenre(for genre : Int, name: String) async {
        do{
            let movieData : MoviesData = try await network.fetchData(as: MoviesData.self, for: Constants.Url.moviesForGenre, with: "&with_genres=\(genre)")
            DispatchQueue.main.async {
                self.movieListForGenre[genre] = movieData.results
            }
        }catch{
            print(error)
        }
    }
    
}
