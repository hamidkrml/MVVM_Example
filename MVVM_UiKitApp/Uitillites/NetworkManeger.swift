//
//  NetworkManeger.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 18.03.25.
//

import Foundation

class NetworkManeger {
    
    /**
     Bu fonksiyon, belirtilen endpoint'e HTTP isteği yaparak veriyi alır ve belirtilen model türüne dönüştürür.
     
     - Parametreler:
        - endpoint: API uç noktası ve HTTP metoduyla ilgili bilgileri içeren bir `EndPoint` nesnesi.
        - completion: Sonuçları işlemek için kullanılan kapanış bloğu. Başarı durumunda veri, hata durumunda ise hata döndürülür.
        
     - İşleyiş:
        1. URLSession ile ağ isteği yapılır.
        2. Eğer hata oluşursa, hata `completion` bloğuna iletilir.
        3. HTTP yanıtı doğrulanır, eğer başarısızsa hata döndürülür.
        4. Verinin geçerli olup olmadığı kontrol edilir, eğer yoksa hata döndürülür.
        5. Veri, `JSONDecoder` kullanılarak belirtilen modele dönüştürülür.
     */
    
    
    static let shared = NetworkManeger()
    private init(){}
    
    private func request<T:Decodable>(_ endpoint:EndPoint,completion: @escaping (Result<T, Error>) -> Void ){
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
                
            }
            
            guard let data = data else {
                
                completion(.failure(URLError(.badURL)))
                return
            }
            do{
                let decodedata = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedata))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

