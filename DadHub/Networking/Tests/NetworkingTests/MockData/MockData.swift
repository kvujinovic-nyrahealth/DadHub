//
//  MockData.swift
//
//
//  Created by Katharina Vujinovic on 06.12.23.
//

import Foundation

public struct MockData: Codable, Sendable {
    public let id: String
    public let content: String
    public let status: Int
    public let isAmazing: Bool
}

extension MockData: Equatable {
    public static func == (lhs: MockData, rhs: MockData) -> Bool {
        lhs.id == rhs.id
    }
}
