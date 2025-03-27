//
//  HomeVievModel.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 21.03.25.
//

import Foundation
 
protocol HomeVievModelP{
    var view: HomeScreenP? { get set }
    func vievDidLoad()
    func fotoDownload()
}




final class HomeVievModel{
    weak var view:HomeScreenP?
//    movieResponse tam olarak Modelimizin isimi gelen veriyi yeni bir diz yazmak icin
    private let service = MovieService()
    var movies : [MovieResult] = []
}




extension HomeVievModel:HomeVievModelP{
        
    func vievDidLoad() {
        view?.configrueVc()
        view?.configrueCollectionView()
        fotoDownload()
    }
    func fotoDownload() {
        service.fetchPopularMovies(page: 1) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            
            DispatchQueue.main.async {
                self.movies = returnedMovies
                print(returnedMovies)
                self.view?.configrueCollectionView()
            }
            // CollectionView'ı güncelle

        }
    }

    
}
