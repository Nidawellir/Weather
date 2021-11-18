//
//  Networking.swift
//  WeatherApp
//
//  Created by Алексей on 11/18/21.
//

import Foundation

protocol Networking {
    func getRequest<T: Codable>(to urlString: String, with parameters: [String : String], completionHandler: @escaping (Result<T, NetworkingError>) -> Void)
}
