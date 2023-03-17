//
//  PosterImageView.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 16.03.2023.
//

import UIKit

final class PosterImageView: UIImageView {

    private var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        // storyBoard ile uğraşılmıyorsa bu kod bütün view larda kullanılmalı
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(movie: MovieResult){
        guard
            let url = URL(string: APIURLs.ımageUrl(posterPath: movie._posterPath)) else { return }
        dataTask = NetworkManager.shared.download(url: url, completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async { self.image = UIImage(data: data) }
            case .failure(_):
                break
            }
        })
        dataTask?.resume()
        
    }
    func cancelDownloading(){
        dataTask?.cancel()
        dataTask = nil
    }

}
