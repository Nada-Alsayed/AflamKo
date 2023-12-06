//
//  HomeTC.swift
//  AflamKo
//
//  Created by MAC on 03/12/2023.
//

import UIKit
import Kingfisher

class HomeTC: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Variables

    static let id = String(describing: HomeTC.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCellUI()
    }
    
    //MARK: - Methods
    
    static func register() -> UINib {
            UINib(nibName: id, bundle: nil)
        }
    
    func setUpCellUI(){
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
    }
    
    func setUPCell(viewModel: MovieTableCellViewModel){
        movieImg.kf.setImage(with:viewModel.image)
        movieName.text = viewModel.title
        year.text = viewModel.year
        rate.text = viewModel.rate
    }
}
