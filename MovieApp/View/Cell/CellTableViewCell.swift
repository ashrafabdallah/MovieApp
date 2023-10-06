//
//  CellTableViewCell.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 04/10/2023.
//

import UIKit
import SDWebImage
class CellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var parentView: UIView!
    
    
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.clipsToBounds = true
        parentView.addBorder(color: .label, width: 1)
        parentView.round()
        parentView.layer.shadowColor = UIColor.black.cgColor
        parentView.layer.shadowOpacity = 0.5
        parentView.layer.shadowOffset = CGSize(width: 0, height: 2) // Adjust the offset as needed
        parentView.layer.shadowRadius = 4 // Adjust the radius as needed
        parentView.layer.masksToBounds = false
        parentView.backgroundColor = .systemGray6
        movieProfile.layer.cornerRadius = 10
        movieProfile.layer.masksToBounds = true
        
    }
    func setupCell(viewmodel:MovieCellViewModel){
        movieName.text = viewmodel.title
        movieDate.text = viewmodel.date
        movieRate.text = viewmodel.rating
        movieProfile.sd_setImage(with: viewmodel.imageUrl)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configure(movie:Movie){
        
    }
}
