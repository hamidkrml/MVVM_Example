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
    
    func request<T: Decodable>(_ endpoint:EndPoint,completion: @escaping (Result<T, Error>) -> Void){
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) {data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 , response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "Invalid Response", code: 0)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid Response data", code: 0)))
                return
            }
            

            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Welcome.self, from: data)
                completion(.success(decoded as! T))
            } catch {
                print(String(describing: error))
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func popularMovies(completion:@escaping(Result<[MovieResponse],Error>)->Void){
        let endpoint = EndPoint.popularMovies
        request(endpoint) { (result: Result<Welcome, Error>) in
            switch result {
            case .success(let welcome):
                completion(.success(welcome.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
