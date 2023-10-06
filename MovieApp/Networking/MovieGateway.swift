//
//  MovieGetWay.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 05/10/2023.
//

import Foundation
import Alamofire
import Moya
class MovieGateway{
    public static var shared = MovieGateway()
    
   private lazy var apiClient:MoyaProvider<MovieEndpoint> = MoyaProvider(plugins: [NetworkLoggerPlugin.init(configuration: .init(logOptions: .verbose))])
   public func getMovies<T:Codable>(completion:@escaping(T?,Error?)->Void){
        apiClient.request(.getTrendingMovie) { result in
            switch result {
            case let .success(moyaResponse):
                do{
                    let data = try moyaResponse.map(T.self)
                    completion(data,nil)
                    
                }catch let jsonError{
                    completion(nil,jsonError)
                }
            case let .failure(MoyaError):
                completion(nil,MoyaError.localizedDescription as? Error)
            }
        }
    }
}
