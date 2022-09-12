//
//  MainViewController+TableView.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    
    func setUpTableView(){
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
        
        self.moviesTableView.backgroundColor = .clear
        self.registerCells()
        self.moviesTableView.tableFooterView = UIView()
        
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
            
        }
    }
    func registerCells(){
        moviesTableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainViewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath)as? MainMovieCell else {
            return UITableViewCell()
        }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setUp(viewModel: cellViewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieID = cellDataSource[indexPath.row].id
        self.openDetails(movieID: movieID)
    }
    
    
}


