//
//  uiimage.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 26.03.25.
//

import UIKit

class PosterImageView: UIImageView {
    var dataTask : URLSessionDataTask?

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func downloadImage(movie:MovieResult){
        let endpoint = EndPoint.image(path: movie.posterPath ?? "")
        dataTask = NetworkManeger.shared.request(endpoint) {[weak self] resultin in
            guard let strongself = self else { return }
            switch resultin {
                
            case .success(let data):
               if let image = UIImage(data: data) {
                   DispatchQueue.main.async{
                       strongself.image = image
                   }
                }
            case .failure(let error):
                print("Görsel yok: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    strongself.image = UIImage(named: "placeholder")
                }
            }
            
        }
    }
}

