//
//  SplashScreen.swift
//  TMDB
//
//  Created by Gautham C on 7/16/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var isSplashActive : Bool
    var moviesViewModel : MoviesViewModel
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            Image("splashScreen")
                .resizable()
                .aspectRatio(0.5, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }.onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now()+5.0){
                self.isSplashActive = false 
                Task{
                    await moviesViewModel.getPopularMovies()
                    await moviesViewModel.getNewMovies()
                    await moviesViewModel.getAllMoviesGenre()
                }
            }
        }
    }
}

#Preview {
    SplashScreen(isSplashActive: .constant(true), moviesViewModel: MoviesViewModel())
}
