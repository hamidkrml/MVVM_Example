//
//  DetailScreen.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 31.03.25.
//

import UIKit


protocol DetailScreenProtocol :AnyObject{
    func configureVC()
    func configurePosterImageView()
    func downloadposterImage()
}

final class DetailScreen: UIViewController {
    private let movie : MovieResult
    
    private let viewModel = DetailViewModel()
    
    private var posterImage : PosterImageView!
    
    private let padding :CGFloat = 16
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidload()
    }

}

extension DetailScreen:DetailScreenProtocol{
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    func configurePosterImageView() {
        posterImage = PosterImageView(frame: .zero)
        view.addSubview(posterImage)
        
        posterImage.layer.cornerRadius = 16
        
        let posterPath = CGFloat.dWidth * 0.4
        
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            posterImage.widthAnchor.constraint(equalToConstant: posterPath),
            posterImage.heightAnchor.constraint(equalToConstant: posterPath * 1.5)
            
        ])
        posterImage.backgroundColor = .red
    }
    func downloadposterImage() {
        posterImage.downloadImage(movie: movie)
    }
    
}
