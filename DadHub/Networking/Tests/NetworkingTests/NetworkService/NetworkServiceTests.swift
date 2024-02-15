//
//  NetworkServiceTests.swift
//
//
//  Created by Katharina Vujinovic on 06.12.23.
//

import XCTest
@testable import Networking

final class NetworkServiceTests: XCTestCase {
    
    private let mockData = MockData(
        id: "1234",
        content: "test",
        status: 1,
        isAmazing: true
    )
    
    private let mockRequest = URLRequest(url: URL(fileURLWithPath: "nothingtoseenothingtodo"))
    
    func testFetchJSON() async throws {
        let sut = makeSUT()
        let data = try await sut.fetchObject(with: mockRequest, responseType: MockData.self)
        
        XCTAssertEqual(data, mockData)
    }
}

// MARK: - Helpers

private extension NetworkServiceTests {
    
    func makeSUT() -> NetworkService {
        NetworkService(networkManager: MockNetworkManager(mockObject: mockData))
    }
}
