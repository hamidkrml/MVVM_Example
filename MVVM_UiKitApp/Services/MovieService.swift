//
//  MovieService.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 26.03.25.
//

import Foundation


final class MovieService {
    func fetchPopularMovies(page: Int, completion: @escaping ([MovieResult]?) -> Void) {
        let endpoint = EndPoint.popularMovies(page: page)
        
        NetworkManeger.shared.request(endpoint) { [weak self] result in
            guard let self = self else { return }
            switch result{
                
            case .success(let data):
                
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
    }
    private func handleWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(data: Data) -> [MovieResult]?{
        do{
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        }catch{
            return nil
        }
    }
}
