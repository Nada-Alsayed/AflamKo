//
//  HomeVC.swift
//  AflamKo
//
//  Created by MAC on 04/12/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    
    let viewModel : HomeViewModel = HomeViewModel()
    var moviesDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    //MARK: - Methods
    
    func viewConfiguration(){
        setUpTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.indicator.startAnimating()
                } else {
                    self?.indicator.stopAnimating()
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            self.moviesDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetails(movieId: String) {
        guard let movie = viewModel.retriveMovie(withId: movieId) else {
            return
        }
        
        DispatchQueue.main.async {
            let details = self.storyboard?.instantiateViewController(withIdentifier: ConstantStrings.DETAILS_VC) as! DetailsVC
            let detailsViewModel = DetailsMovieViewModel(movie: movie)
            details.modalPresentationStyle = .fullScreen
            details.viewModel = detailsViewModel
            self.present(details,animated: true)
        }
    }
}
