//
//  NetworkServiceProtocol.swift
//
//
//  Created by Katharina Vujinovic on 06.12.23.
//

import Foundation

public enum NetworkingError: Error {
    case networkError
    case invalidURL
    case decodingError
}

public protocol NetworkService {
    var url: URL? { get }
    var httpMethod: String { get }
    var value: String { get }
    var header: String { get }
}
