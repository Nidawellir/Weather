//
//  NetworkingError.swift
//  WeatherApp
//
//  Created by Алексей on 24.11.2021.
//

import Foundation

enum NetworkingError: Error {
    case failedToCreateURLComponents
    case failedToCreateURL
    case failedToDecode
    case networkError
}
