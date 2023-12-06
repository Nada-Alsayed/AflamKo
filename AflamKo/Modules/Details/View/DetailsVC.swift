//
//  DetailsVC.swift
//  AflamKo
//
//  Created by MAC on 06/12/2023.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var myView: UIView!
    
    //MARK: - Variables
    
    var viewModel: DetailsMovieViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        addImgGesture()
    }
    
    //MARK: - Methods

    func configView() {
        myView.layer.cornerRadius = 28
        myView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        movieTitle.text = viewModel?.movieTitle
        movieImage.kf.setImage(with: viewModel?.movieImage)
        movieDescription.text = viewModel?.movieDescription
    }
    
    func addImgGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        backImg.isUserInteractionEnabled = true
        backImg.addGestureRecognizer(tap)
    }
    
    @objc func back(){
        dismiss(animated: true)
    }
}
