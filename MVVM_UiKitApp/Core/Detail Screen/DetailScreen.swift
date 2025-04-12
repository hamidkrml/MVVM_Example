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
    func configerTitleLabel()
    func configerDateLabel()
    func configerOverviewLabel()
}

final class DetailScreen: UIViewController {
    private let movie : MovieResult
    
    private let viewModel = DetailViewModel()
    
    private var posterImage : PosterImageView!
    
    private let padding :CGFloat = 16
    
    private var titleLabel : UILabel!
    
    private var dateLabel: UILabel!
    
    private var overviewLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        
        print("veri geldi ")
    }
    
    deinit {
        print("veri gitti")
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
        posterImage.clipsToBounds = true
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
    func configerTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor,constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            
        ])
        
    }
    func configerDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
    
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 20)
        dateLabel.textColor = .secondaryLabel
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3 * padding),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func configerOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.text = movie._overview
        overviewLabel.font = .systemFont(ofSize: 21)
        overviewLabel.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 2 * padding),
            overviewLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
            
        ])
    }
}
