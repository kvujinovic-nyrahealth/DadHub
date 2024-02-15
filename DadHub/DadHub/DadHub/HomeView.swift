//
//  HomeView.swift
//  DadHub
//
//  Created by Katharina Vujinovic on 06.12.23.
//


import SwiftUI
import Networking
import Jokes

struct HomeView: View {
    let networkManager = NetworkManager()
    
    var body: some View {
        Text("Hello, World!")
            .task(priority: .background) {
                do {
                    let joke = try await
                    networkManager.fetchObject(with: JokeService.fetchRandomJoke, responseType: Joke.self)
                    print("YAY! We have a joke! \(joke.content)")
                } catch let error {
                    print("no joke today!: \(error)")
                }
                
            }
    }
}

#Preview {
    HomeView()
}
