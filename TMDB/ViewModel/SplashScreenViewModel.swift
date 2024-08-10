//
//  SplashScreenViewCOntroller.swift
//  TMDB
//
//  Created by Gautham C on 7/23/24.
//

import SwiftUI

struct SplashScreenViewModel: View {
    
    @State var isSplashScreenActive : Bool = true
    @ObservedObject var movieModel = MoviesViewModel()
    
    var body: some View {
        if !isSplashScreenActive {
            MoviesView(movieModel: movieModel)
        } else {
            SplashScreen(isSplashActive: $isSplashScreenActive, moviesViewModel: movieModel)
        }
    }
}

#Preview {
    SplashScreenViewModel()
}
