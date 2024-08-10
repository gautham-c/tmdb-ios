//
//  DetailsView.swift
//  TMDB
//
//  Created by Gautham C on 8/9/24.
//

import SwiftUI

struct DetailsView: View {
    
    var movieData: Movie
    var genreList : [Genre]
    
    var body: some View {
        ZStack{
            Color(Constants.Colors.skeptic)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack(alignment: .bottom) {
                    if let imageUrl = URL(string: "\(Constants.Url.imageURL)\(movieData.poster_path)"){
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                case .failure:
                                    Color.gray
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                @unknown default:
                                    EmptyView()
                            }
                        }
                        .clipped()
                    }
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.1), Color.black.opacity(0.75)]),
                                   startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                    Text(movieData.original_title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .padding(.leading, 20)
                }
                Spacer()
                ScrollView{
                    VStack(alignment: .leading){
                        HStack {
                            Text("Rating:")
                                .font(.headline)
                                .padding(.trailing, 5)
                            ProgressView(value: movieData.vote_average, total: 10.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: Color(Constants.Colors.wedgewood)))
                                .scaleEffect(x: 1, y: 2, anchor: .center)
                            Text("\(String(format: "%.f", movieData.vote_average*10))%")
                        }
                            .padding()
                            .cornerRadius(8)
                        Text("Overview:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(movieData.overview)
                            .font(.title3)
                            .foregroundStyle(Color(Constants.Colors.wedgewood))
                        Text("Genre: ")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(Helper.getGenreNames(for: movieData.genre_ids, genreList: genreList).joined(separator: ", "))
                            .font(.title3)
                            .foregroundStyle(Color(Constants.Colors.wedgewood))
                    }
                    .padding([.leading,.trailing])
                }
            }
        }
    }
}

#Preview {
    DetailsView(movieData: Movie(
                id: 1,
                overview: "An epic adventure across the universe where heroes and villains clash.",
                original_language: "en",
                backdrop_path: "/backdrop.jpg",
                poster_path: "/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg",
                vote_average: 8.5,
                genre_ids: [12, 28],
                original_title: "Deadpool and Wolverine"
    ), genreList: [
        Genre(id: 12, name: "Action"),
        Genre(id: 28, name: "Adventure")
    ])
}
