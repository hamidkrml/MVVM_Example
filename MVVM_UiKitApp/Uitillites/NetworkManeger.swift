//
//  NetworkManeger.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 18.03.25.
//

import Foundation

class NetworkManeger {
    static let shared = NetworkManeger()
    private init(){}
    
    func download(url:URL,completion: @escaping (Result<Data, Error>) -> ()){
        URLSession.shared.downloadTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {return}
            
            guard let data = data else {return}
            
        }
    }
}

