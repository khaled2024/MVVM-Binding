//
//  MainViewModel.swift
//  MVVM-Binding
//
//  Created by KhaleD HuSsien on 11/09/2022.
//

import Foundation
class MainViewModel {
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    
    //MARK: - functions
    func numberOfSections()->Int{
        1
    }
    
    func numberOfRows(in section: Int)-> Int{
        self.dataSource?.results.count ?? 0
    }
    
    func getData(){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result{
            case.failure(let error):
                print(error)
            case .success(let data):
                print(data.results.count)
                self?.dataSource = data
                self?.mapCellData()
            }
        }
    }
    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results.compactMap({
            MovieTableCellViewModel(movie: $0)
        })
    }
    func retriveMovie(with id: Int)-> Movie?{
        guard let movie = dataSource?.results.first(where: {
            $0.id == id
        })else{
            return nil
        }
        return movie
    }
}
