//
//  HomeViewModel.swift
//  AflamKo
//
//  Created by MAC on 04/12/2023.
//

import Foundation

class HomeViewModel{
    
    //MARK: - Variables

    private let api : MoviesAPI = MoviesAPI()
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: [Movie]?
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    //MARK: - Methods

    func numberOfSections() -> Int{
        return 1
    }
    
    func rowsNumberInSection(section:Int) -> Int{
        return dataSource?.count ?? 0
    }
    
    func getData(){
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        api.getMovies { [weak self] movies in
            self?.isLoadingData.value = false
            guard let movies = movies else {return}
            self?.dataSource = movies
            self?.mapMovieData()
        }
    }
    
    private func mapMovieData() {
        movies.value = self.dataSource?.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.title ?? ""
    }
    
    func retriveMovie(withId id: String) -> Movie? {
        guard let movie = dataSource?.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
