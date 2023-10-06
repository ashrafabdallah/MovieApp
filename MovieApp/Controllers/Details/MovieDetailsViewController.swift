//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 06/10/2023.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    var moiveDeatilsViewModel:DetailsViewModel
    init(moiveDeatilsViewModel:DetailsViewModel){
        self.moiveDeatilsViewModel=moiveDeatilsViewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Details"
        movieName.text = moiveDeatilsViewModel.title
        movieDesc.text = moiveDeatilsViewModel.description
        movieImage.sd_setImage(with: moiveDeatilsViewModel.imageUrl)
        
    }


   

}
