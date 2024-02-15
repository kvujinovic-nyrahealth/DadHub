//
//  Joke.swift
//
//
//  Created by Katharina Vujinovic on 06.12.23.
//

import Foundation

public struct Joke: Codable, Sendable {
    public let id: String
    public let content: String
    public let status: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case content = "joke"
        case status
    }
}

extension Joke: Equatable {
    public static func == (lhs: Joke, rhs: Joke) -> Bool {
        lhs.id == rhs.id
    }
}
