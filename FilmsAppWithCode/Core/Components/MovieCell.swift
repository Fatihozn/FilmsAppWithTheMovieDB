//
//  MovieCell.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 15.03.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // cell ler reuseable oldukları için ve tekrar kullanılmaya hazırlanacağı için burada silinecek olan cell i sıfırlıyoruz
        posterImageView.image = nil
        posterImageView.cancelDownloading()
        
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true // view dan taşan kısımları kırpar image view a radius vermediğimiz halde verilmiş gibi görünür
    }
    
    private func configurePosterImageView(){
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)

        posterImageView.pinToEdgesOf(view: self)
        
        
    }
}
