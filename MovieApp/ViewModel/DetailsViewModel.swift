//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 06/10/2023.
//

import Foundation
class DetailsViewModel{
    var movie:Movie
    var title:String
    var description:String
    var id:Int
    var imageUrl:URL?
    init(movie: Movie) {
        self.movie = movie
        self.title = movie.title ?? movie.name ?? ""
        self.description = movie.overview
        self.id = movie.id
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    func makeImageUrl(_ imageCode:String)->URL?{
        return URL(string: "\(NetworkingConstant.shared.imageServerAddress)\(imageCode)")
    }
}
