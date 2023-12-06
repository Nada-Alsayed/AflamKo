//
//  HomeTableViewExtension.swift
//  AflamKo
//
//  Created by MAC on 05/12/2023.
//

import Foundation
import UIKit

extension HomeVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rowsNumberInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTC.id, for: indexPath) as! HomeTC
        cell.setUPCell(viewModel: moviesDataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = moviesDataSource[indexPath.row].id
        self.openDetails(movieId: movieId)
    }
    
    func setUpTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        registerCells()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCells() {
        self.tableView.register(HomeTC.register(), forCellReuseIdentifier: HomeTC.id)
    }
}
