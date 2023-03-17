//
//  HomeViewModel.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 15.03.2023.
//

import Foundation

// bu iki class arasında protocoller ile iletişim kurulacak ve kullanılması gereken işlemler kısıtlanacak

protocol HomeViewModelProtocol {
    var view: HomeScreenProtocol?{ get set }
    
    func viewDidLoad()
    func getMovies()
}

// view homescreen classını gösteriyor
// weak işlemi 2 class birbirini gösterdiği için ram dolmaması için biri zayıflatılır
// weak yapabilmek için referans aldığımız protocola AnyObject eklenmesi gerekir bu işlem
// protocol ün sadece classlarda kullanılacağını kesinleştirmek için yapılır
final class HomeViewModel {
    
    weak var view: HomeScreenProtocol? // WEAK açıklaması yukarıda
    private let service = MovieService()
    var movies = [MovieResult]()
    private var page: Int = 1
    var shouldDownloadMore = true
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        shouldDownloadMore = false
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
            self.shouldDownloadMore = true
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
            
            self.view?.navigateToDetailScreen(movie: returnedDetail)
        }
    }
    
}
    
