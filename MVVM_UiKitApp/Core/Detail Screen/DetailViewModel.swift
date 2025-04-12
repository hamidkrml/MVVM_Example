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
    // bellekte sismemesin sagliyor detail screen gitigi zaman init ciktidi deinit olmasi icin WEAK
    weak var view: DetailScreenProtocol?
}

extension DetailViewModel : DetailViewModelProtocol{
    func viewDidload() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadposterImage()
        view?.configerTitleLabel()
        view?.configerDateLabel()
        view?.configerOverviewLabel()
    }
    
    
}
