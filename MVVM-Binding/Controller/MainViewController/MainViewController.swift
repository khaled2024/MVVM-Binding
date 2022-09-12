//
//  MainViewController.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import UIKit

class MainViewController: UIViewController {
    /// IBOutlets
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    /// Vars
    let mainViewModel = MainViewModel()
    var cellDataSource : [MovieTableCellViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        mainViewModel.getData()
        
    }
    //MARK: - Functions
    func configView(){
        title = "Trending movies"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        setUpTableView()
    }
    func bindViewModel(){
        mainViewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{return}
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
            
        }
        mainViewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self , let movies = movies else{return}
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    func openDetails(movieID: Int){
        guard let movie = mainViewModel.retriveMovie(with: movieID)else{
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
    
}
