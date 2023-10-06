//
//  MovieCellViewModel.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 06/10/2023.
//

import Foundation
class MovieCellViewModel {
    var id:Int
    var title:String
    var date:String
    var rating:String
    var imageUrl:URL?
    init(movie:Movie){
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    func makeImageUrl(_ imageCode:String)->URL?{
        return URL(string: "\(NetworkingConstant.shared.imageServerAddress)\(imageCode)")
    }
}

