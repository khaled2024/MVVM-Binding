//
//  APICaller.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import Foundation
import  UIKit
enum NetworkError: Error {
    case urlError
    case canNoParseData
}

public class APICaller{

    static func getTrendingMovies(completion: @escaping (Result<TrendingMovieModel,Error>)-> Void){
        let urlString = NetworkServices.shared.serverAddress + "trending/movie/day?api_key=" + NetworkServices.shared.apiKey
        guard let url = URL(string: urlString)else{
            completion(.failure(NetworkError.urlError))
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil ,
               let data = data ,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completion(.success(resultData))
            }else{
                completion(.failure(NetworkError.canNoParseData))
            }
        }.resume()
    }
}
