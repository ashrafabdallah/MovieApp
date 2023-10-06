//
//  MainViewController.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 04/10/2023.
//

import UIKit

class MainViewController: UIViewController {
  
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private  var mainViewModel:MainViewModel  = MainViewModel()
    @IBOutlet weak var tableViewTv: UITableView!
   var cellDataSouurse = [MovieCellViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Trending Movies"
        tableViewTv.registerByNib(cellClass: CellTableViewCell.self)
        tableViewTv.delegate=self
        tableViewTv.dataSource=self
        tableViewTv.backgroundColor = .clear
        setBinder()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainViewModel.getMovies()
    }
    private func setBinder(){
        mainViewModel.isLoading.bind { [weak self] isloading in
            guard let self = self , let isloading = isloading else{return}
            DispatchQueue.main.async {
                if isloading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        mainViewModel.cellDataSource.bind {[weak self] movies in
            guard let self = self , let movies = movies else {return}
            self.cellDataSouurse = movies
            print("Data.. \(self.cellDataSouurse)")
            DispatchQueue.main.async {
                self.tableViewTv.reloadData()
            }
        
        }
    }
    func openDetailsScreen(id:Int){
        guard let movie = mainViewModel.getMovieDeatils(id) else {return}
        let deatilsViewModel = DetailsViewModel(movie: movie)
        let detailsViewController = MovieDetailsViewController(moiveDeatilsViewModel: deatilsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension MainViewController :UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainViewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: CellTableViewCell.self)
        let movieCellViewModel = cellDataSouurse[indexPath.row]
        cell.setupCell(viewmodel: movieCellViewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id  = cellDataSouurse[indexPath.row].id
        self.openDetailsScreen(id: id)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
}

