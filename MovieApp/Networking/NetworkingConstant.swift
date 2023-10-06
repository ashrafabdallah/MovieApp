//
//  NetworkingConstant.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 05/10/2023.
//

import Foundation
class NetworkingConstant{
    static var shared = NetworkingConstant()

        let apiKey = "791da0f629bcdb8512018d6d1156f40e"
    
    public let baseUrl = "https://api.themoviedb.org/3"
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
