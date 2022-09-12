//
//  MainMovieCell.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import UIKit
import SDWebImage
class MainMovieCell: UITableViewCell {
    
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var moveDate: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    public static let identifier = String(describing: MainMovieCell.self)
    public static func register()-> UINib{
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.addBorder(color: .label, width: 1)
        backView.round()
        movieImageView.round(5)
        
    }
    func setUp(viewModel: MovieTableCellViewModel){
        self.movieName.text = viewModel.title
        self.movieRate.text = viewModel.rate
        self.moveDate.text = viewModel.date
        self.movieImageView.sd_setImage(with: viewModel.imageURL)
    }
    
}
