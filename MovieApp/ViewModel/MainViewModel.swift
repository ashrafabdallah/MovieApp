//
//  MainViewModel.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 04/10/2023.
//

import Foundation
class MainViewModel{
    var isLoading:Observable<Bool> = Observable(false)
    var cellDataSource:Observable<[MovieCellViewModel]> = Observable(nil)
     var dataSourse:MovieResponse?
    func numberOfSections()->Int{
        return 1
    }
    func numberOfRows(in secetion:Int)->Int{
        return dataSourse?.results.count ?? 0
    }
    func getMovies(){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        MovieGateway.shared.getMovies { [weak self](response:MovieResponse?,error)  in
            guard let self = self else{return}
            self.isLoading.value = false
            if error == nil {
                self.dataSourse = response
                self.mapCellData()
            }else
            {
                print("error is \(error)")
            }
        }
    }
    func mapCellData(){
        self.cellDataSource.value = self.dataSourse?.results.compactMap({ MovieCellViewModel(movie: $0)
        })
    }
    func getMovieTitle(_ movie:Movie)->String{
        return movie.title ?? movie.name ?? ""
    }
    func getMovieDeatils(_ id:Int)->Movie?{
        guard let movie = self.dataSourse?.results.first(where: { $0.id == id }) else {return nil}
        return movie
    }
    
}
