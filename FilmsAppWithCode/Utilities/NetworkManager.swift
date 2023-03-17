//
//  NetworkManager.swift
//  FilmsAppWithCode
//
//  Created by Fatih Özen on 13.03.2023.
//

import Foundation

class NetworkManager{
    // singelten yapı yani sadece burada oluşturulabilir
    // shared kullanılarak ulaşılacak
    static let shared = NetworkManager()
    
    private init(){} // bu yazılmazsa netwokManager objesi istenildiği kadar oluşturulur amacımız yanlızca burada oluşturulması ve shared kullanılarak işlem yapılması
    
    @discardableResult
    // anotation : dönüş tipini kullanmak istemezsen bu anotation kullan uyarıları kaldır
    func download(url: URL, completion: @escaping (Result<Data,Error>) -> ()) -> URLSessionDataTask{
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
    
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else{
                completion(.failure(URLError(.badServerResponse)))
                return
                
            }
            
            guard
                let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
          
            completion(.success(data))
            
        }
        dataTask.resume()
        
        return dataTask
    }
    
}
