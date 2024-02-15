//
//  MockNetworkingManager.swift
//
//
//  Created by Katharina Vujinovic on 06.12.23.
//

import Foundation
@testable import Networking

struct MockNetworkManager: NetworkServiceProtocol {
    
    let mockObject: Codable
    
    func fetchData(from url: URL) async throws -> Data {
        try JSONEncoder().encode(mockObject)
    }
}

