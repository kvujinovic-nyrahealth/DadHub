//
//  JokeService.swift
//
//
//  Created by Katharina Vujinovic on 06.12.23.
//

import Foundation
import Networking

public enum JokeService: NetworkService, Sendable {
    case fetchRandomJoke
    case fetchJokeAsImage(jokeId: String)
    
    public var url: URL? {
        switch self {
        case .fetchRandomJoke:
            return URL(string: "https://icanhazdadjoke.com/")
        case .fetchJokeAsImage(let jokeId):
            return URL(string: "https://icanhazdadjoke.com/j/\(jokeId).png")
        }
    }
    
    public var httpMethod: String {
        switch self {
        case .fetchRandomJoke, .fetchJokeAsImage:
            return "GET"
        }
    }
    
    public var value: String {
        switch self {
        case .fetchRandomJoke, .fetchJokeAsImage:
            return "application/json"
        }
    }
    
    public var header: String {
        switch self {
        case .fetchRandomJoke, .fetchJokeAsImage:
            return "Accept"
        }
    }
}


