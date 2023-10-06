//
//  EndPoint.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 05/10/2023.
//

import Foundation
import Alamofire
import Moya
enum MovieEndpoint{
    case getTrendingMovie
}
extension MovieEndpoint :TargetType{
    var someDate:Data{
    return Data()
    }
    var baseURL: URL {
        return URL(string: NetworkingConstant.shared.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getTrendingMovie: return "/trending/all/day"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTrendingMovie : return.get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTrendingMovie: return .requestParameters(parameters: ["api_key" : NetworkingConstant.shared.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
       return ["Content-Type": "application/json"]
    }
    
    
}
