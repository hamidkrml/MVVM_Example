//
//  DetailScreen.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 31.03.25.
//

import UIKit


protocol DetailScreenProtocol :AnyObject{
    
}

class DetailScreen: UIViewController {
    private let movie : MovieResult
    
    private let viewModel = DetailViewModel()
    
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
        view.backgroundColor = .systemBackground
    }

}

extension DetailScreen:DetailScreenProtocol{
    
}
