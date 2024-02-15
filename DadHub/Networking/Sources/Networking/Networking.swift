// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct NetworkManager {
    
    public init() {}
    
    public func fetchObject<T: Decodable>(with service: NetworkService, responseType: T.Type) async throws -> T {
        guard let request = createURLRequest(with: service) else { throw NetworkingError.invalidURL }
        let data = try await fetchData(from: request)
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(responseType, from: data)
            return response
        } catch {
            throw NetworkingError.decodingError
        }
    }
    
    private func createURLRequest(with service: NetworkService) -> URLRequest? {
        guard let url = service.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = service.httpMethod
        request.setValue(service.value, forHTTPHeaderField: service.header)
        return request
    }
    
    private func fetchData(from request: URLRequest) async throws -> Data {
        let (data, _) = try await session.data(for: request)
        return data
    }
    
    private var session: URLSession {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }
}
