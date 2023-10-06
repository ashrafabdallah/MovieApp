//
//  Extension+Tableview.swift
//  MovieApp
//
//  Created by Ashraf Eltantawy on 04/10/2023.
//

import Foundation
import UIKit
extension UITableView{
    func registerByNib(cellClass:UITableViewCell.Type){
        self.register(UINib(nibName: cellClass.cellNibName, bundle: nil), forCellReuseIdentifier: cellClass.cellIdeitifer)
    }
    func registerByClass(cellClass:UITableViewCell.Type){
        self.register(cellClass, forCellReuseIdentifier: cellClass.cellIdeitifer)
    }
    func decuReusableCell<T:UITableViewCell>(cellClass:T.Type,indexPath:IndexPath)->T?{
        guard let cell :T = self.dequeueReusableCell(withIdentifier: cellClass.cellIdeitifer, for: indexPath) as? T else  {fatalError("no \(cellClass.cellIdeitifer) register.")}
        return cell
    }
    func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type) -> T {
        guard let cell: T = self.dequeueReusableCell(withIdentifier: cellClass.cellIdeitifer) as? T else {
            fatalError("no \(cellClass.cellIdeitifer) registered")
        }
        return cell
    }
}
extension UITableViewCell{
    static var cellNibName:String{
        return NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
    static var cellIdeitifer:String{
        return NSStringFromClass(Self.self)
    }
}

