//
//  MovieTableCellViewModel.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import Foundation
import UIKit

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rate: String
    var imageURL: URL?
    
    init(movie: Movie){
        self.id = movie.id
        self.title = movie.title
        self.date = movie.releaseDate
        self.rate = movie.releaseDate
        self.imageURL = makeImageURL(imageCode: movie.posterPath )
    }
    private func makeImageURL(imageCode: String)-> URL?{
        URL(string: "\(NetworkServices.shared.imageServerAddress)\(imageCode)")
    }
}
