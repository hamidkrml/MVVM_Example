//
//  final .swift
//  MVVM_UiKitApp
//
//  Created by hamid on 03.04.25.
//

import Foundation

protocol DetailViewModelProtocol {
    var view :DetailScreenProtocol?{ get set}
    func viewDidload()
}



final class DetailViewModel{
    weak var view: DetailScreenProtocol?
}

extension DetailViewModel : DetailViewModelProtocol{
    func viewDidload() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadposterImage()
    }
    
    
}
