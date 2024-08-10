//
//  ContentView.swift
//  TMDB
//
//  Created by Gautham C on 7/16/24.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var movieModel : MoviesViewModel
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(Constants.Colors.skeptic)
                    .edgesIgnoringSafeArea(.all)
                if !movieModel.getNewMovieList().isEmpty {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(movieModel.getAllMovieGerneList()) { genre in
                                    VStack(alignment: .leading, spacing: 10) {
                                            Text(genre.name)
                                                .foregroundStyle(Color(Constants.Colors.wedgewood))
                                                .font(.title)
                                                .padding([.leading,.trailing])
                                            VStack{
                                                ScrollView(.horizontal){
                                                    HStack(spacing: 10){
                                                        let movies : [Movie] = movieModel.getMoviesForGerneList(genreId: genre.id)
                                                        if !movies.isEmpty{
                                                            ForEach(movies) {movie in
                                                                VStack{
                                                                    let imageUrl = URL(string: "\(Constants.Url.imageURL)\(movie.poster_path)")
                                                                    if imageUrl != nil {
                                                                        NavigationLink {
                                                                            DetailsView(movieData: movie, genreList: movieModel.getAllMovieGerneList())
                                                                        } label: {
                                                                            AsyncImage(url: imageUrl) { phase in
                                                                                switch phase {
                                                                                case .empty:
                                                                                    ProgressView()
                                                                                        .frame(width: 150, height: 200)
                                                                                case .success(let image):
                                                                                    image
                                                                                        .resizable()
                                                                                        .aspectRatio(contentMode: .fill)
                                                                                        .frame(width: 150, height: 200)
                                                                                        .cornerRadius(10)
                                                                                case .failure:
                                                                                    Color.gray
                                                                                        .frame(width: 150, height: 200)
                                                                                        .cornerRadius(10)
                                                                                @unknown default:
                                                                                    EmptyView()
                                                                                }
                                                                            }
                                                                        }
                                                                    } else {
                                                                        Color.gray
                                                                           .frame(width: 150, height: 150)
                                                                           .cornerRadius(10)
                                                                           .padding([.top])
                                                                    }
                                                                    
                                                                    Text(movie.original_title)
                                                                        .foregroundStyle(Color(Constants.Colors.wedgewood))
                                                                        .font(.headline)
                                                                        .padding([.leading, .trailing])
                                                                }
                                                                .frame(width:150)
                                                                .cornerRadius(10)
                                                                .background(Color(Constants.Colors.zumthor))
                                                                .shadow(radius: 5)
                                                                .contentShape(Rectangle())
                                                                .onTapGesture{
                                                                    
                                                                }
                                                            }
                                                        } else {
                                                            ProgressView()
                                                                .padding([.leading,.trailing])
                                                        }
                                                    }
                                                }
                                            }
                                        
                                    }
                                    .onAppear(){
                                        Task{
                                            await movieModel.getMoviesForGenre(for:genre.id, name: genre.name)
                                        }
                                    }
                            }
                        }
                    }
                } else {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
        }
    }
}

#Preview {
    MoviesView(movieModel: MoviesViewModel())
}
