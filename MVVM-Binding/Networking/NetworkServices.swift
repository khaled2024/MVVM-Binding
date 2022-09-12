//
//  NetworkServices.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import Foundation
class NetworkServices{
    static let shared = NetworkServices()
    private init(){}
    public var apiKey: String {
        get{
            return "4e64d9425b76606aee7f62bfe7fbc67b"
        }
    }
    public var serverAddress: String{
        get{
            return "https://api.themoviedb.org/3/"
        }
    }
    public var imageServerAddress: String{
        get{
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
