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
    case User
    
}

protocol EndPointProtocol {
    var baseurl:String {get}
    var path:String {get}
    var method: http {get}
    var headers: [String: String]? {get}
    func request() -> URLRequest
}


extension EndPoint:EndPointProtocol{
    
    var baseurl: String {
        return ""
    }
    
    var path: String {
        return "/"
        
    }
    var method: http {
        switch self {
        case .User: return .get
        }
    }
    var headers: [String : String]? {
        return nil
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
            fatalError("Urlhatalidir")
        }
        commpents.path = path
        var request = URLRequest(url: commpents.url!)
        request.httpMethod = method.rawValue
        
        if let header = headers {
            for (key,value) in header{
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
