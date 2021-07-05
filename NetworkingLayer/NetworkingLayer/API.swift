//
//  NetworkingManager.swift
//  NetworkingLayer
//
//  Created by Artur Igberdin on 20.04.2021.
//

import Foundation

class API {
    
    class func request<T: Codable>(_ endpoint: Endpoint, completion: @escaping(Result<T, Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
        
        guard let url = components.url else { return }
        
        print(url)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        //default session - use disk-based cache, stores credentials in keychain, stores cookies
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else { return }
            
            
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed"])
                    completion(.failure(error))
                }
            }
        }
        
        dataTask.resume()
    }
}
