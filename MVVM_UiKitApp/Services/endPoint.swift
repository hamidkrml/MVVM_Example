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
    case popularMovies(page:Int)
    
    case image(path: String)
    
    case detail(id:Int)
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
        switch self{
            
        case .popularMovies:
            return [
                "accept": "application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MmI3MWFjYmMwZmI5M2M1OTI0YmVkYTY4MTY2YTMzOSIsIm5iZiI6MTc0MjU0OTQ2NC4xMzc5OTk4LCJzdWIiOiI2N2RkMzFkOGQ2ODEwNDUyNzk2OTgwZGYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qquIBMdIXE6TuPlFG6T5JVP8EDXlEOMOfo65G2Q8IkM"
            ]
        case .image:
            return nil
        case .detail:
            return nil
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .popularMovies(let page):
            return  [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        case .image: return nil
        case .detail:
            return [
                URLQueryItem(name: "api_key", value: "e112ed72df8da5c3b38e4e6579896bc6"),
                URLQueryItem(name: "language", value: "en-US")
            ]
        }
    }
    
    
    var baseurl: String {
        switch self{
            
        case .popularMovies:
            return "https://api.themoviedb.org"
       
        case .image:
            return "https://image.tmdb.org"
        case .detail:
            return "https://api.themoviedb.org"
        }
    }
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
       
        case .image(let path):
            let cleanedPath = path.starts(with: "/") ? String(path.dropFirst()) : path
            return "/t/p/w500/\(cleanedPath)"
        case .detail(id: let id):
            return "/3/movie/\(id)"
        }
    }
    
    var method: http {
        switch self {
        case .popularMovies: return .get
      
        case .image: return .get
        case .detail: return .get
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
        guard var commpents = URLComponents(string: baseurl)else{
            fatalError("url hatalidir")
        }
        commpents.path = path
        if let queryItems = queryItems {
            commpents.queryItems = queryItems
            }
        var request = URLRequest(url: commpents.url!)
        request.httpMethod = method.rawValue
        
        
        if let header = headers{
            for (key,value) in header{
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        print(request)
        return request
    }
}
//  Bu dosya, API bağlantılarını yönetir ve gerekli HTTP isteklerini oluşturur.
//  EndPoint enum'u, farklı API uç noktalarını ve her bir uç nokta için kullanılan HTTP metodunu tanımlar.
//  EndPointProtocol protokolü, URL, path, method ve headers gibi temel bilgileri sağlar.
//  Bu yapı, API isteklerini merkezi bir şekilde yönetmek ve modüler hale getirmek için kullanılır.
