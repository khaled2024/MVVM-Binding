//
//  DetailsMovieViewModel.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 12/09/2022.
//

import Foundation

class DetailsMovieViewModel{
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie){
        self.movie = movie
        self.movieID = movie.id
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(imageCode: movie.backdropPath)
    }
    func makeImageURL(imageCode: String)-> URL?{
        URL(string: "\(NetworkServices.shared.imageServerAddress)\(imageCode)")
    }
}
