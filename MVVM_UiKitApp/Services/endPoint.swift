//
//  endPoint.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 20.03.25.

import Foundation

enum http : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum EndPoint {
    
    case popularMovies
}

protocol EndPointProtocol {
    var baseurl:String {get}
    var path:String {get}
    var method: http {get}
    var headers: [String: String]? {get}
    var queryItems: [URLQueryItem]? { get } // yeni eklendi!
    
    func request() -> URLRequest
}


extension EndPoint:EndPointProtocol{
    var headers: [String : String]? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .popularMovies:
            return  [
                URLQueryItem(name: "api_key", value: "42b71acbc0fb93c5924beda68166a339"),
                
            ]
            
            
        }
    }
    
    
    var baseurl: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        }
    }
    
    var method: http {
        switch self {
        case .popularMovies: return .get
        }
    }
    
    
    
    /*
     Bu fonksiyon, bir API isteği (URLRequest) oluşturur ve
     gerekli ayarları yaparak istek gönderilmesi için hazır hale getirir.
     - baseurl: API'nin temel URL'si.
     - path: Belirli endpoint (yol).
     - method: HTTP metodu (GET, POST vb.).
     - headers: (isteğe bağlı) HTTP başlıkları.
     */
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseurl) else {
            fatalError("URL hatalıdır")
        }
        
       
        components.path = path
        
       
        if let queryItems = queryItems {
            components.queryItems = queryItems
        }
        
       
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
       
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}
//  Bu dosya, API bağlantılarını yönetir ve gerekli HTTP isteklerini oluşturur.
//  EndPoint enum'u, farklı API uç noktalarını ve her bir uç nokta için kullanılan HTTP metodunu tanımlar.
//  EndPointProtocol protokolü, URL, path, method ve headers gibi temel bilgileri sağlar.
//  Bu yapı, API isteklerini merkezi bir şekilde yönetmek ve modüler hale getirmek için kullanılır.
