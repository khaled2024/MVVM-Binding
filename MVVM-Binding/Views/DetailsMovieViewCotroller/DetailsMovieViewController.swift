//
//  DetailsModelViewController.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 12/09/2022.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {
    
    @IBOutlet weak var movieDescreption: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var viewModel : DetailsMovieViewModel
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
    }
    func configView(){
        self.title = "Movie Details"
        navigationController?.navigationBar.prefersLargeTitles = false
        movieTitle.text = viewModel.movieTitle
        movieDescreption.text = viewModel.movieDescription
        movieImageView.sd_setImage(with: viewModel.movieImage)
    }
    
    
    
}
