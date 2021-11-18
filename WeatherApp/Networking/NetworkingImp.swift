//
//  NetworkingImp.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

import Foundation

enum NetworkingError: Error {
    case failedToCreateURLComponents
    case failedToCreateURL
    case failedToDecode
    case networkError
}

final class NetworkingImp {
    
    // MARK: - Static properties
    
    static let shared: Networking = NetworkingImp()
    
    // MARK: - Private properties
    
    private let urlSession = URLSession.shared
    private let jsonDecoder = JSONDecoder()
    
    // MARK: - Initialization
    
    private init() {}
}

// MARK: - Networking

extension NetworkingImp: Networking {
    func getRequest<T: Codable>(to urlString: String, with parameters: [String : String], completionHandler: @escaping (Result<T, NetworkingError>) -> Void) {
        guard var urlComponents = URLComponents(string: urlString) else {
            completionHandler(.failure(.failedToCreateURLComponents))
            return
        }
        
        urlComponents.queryItems = parameters.map { .init(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else {
            completionHandler(.failure(.failedToCreateURL))
            return
        }
        
        let dataTask = urlSession.dataTask(with: url) { [jsonDecoder] data, response, error in
            guard error == nil else { completionHandler(.failure(.networkError)); return }
            
            guard let data = data else { return }
            
            do {
                let decodableData = try jsonDecoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(.success(decodableData))
                }
            } catch {
                completionHandler(.failure(.failedToDecode))
            }
        }
        
        dataTask.resume()
    }
}
