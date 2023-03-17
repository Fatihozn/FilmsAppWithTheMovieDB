//
//  DetailViewModel.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 17.03.2023.
//

import Foundation

protocol DetailViewModelProtocol {
    var view: DetailScreenProtocol? { get set }
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view:  DetailScreenProtocol?
    
}

extension DetailViewModel: DetailViewModelProtocol {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverViewLabel()
    }
}
