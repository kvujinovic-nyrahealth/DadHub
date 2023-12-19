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
    let networkService = NetworkService(networkManager: NetworkManager())
    
    var body: some View {
        Text("Hello, World!")
            .task(priority: .background) {
                guard let request = JokeService.fetchRandomJoke.request else {
                    print("whoopsie! No URL!")
                    return
                }
                do {
                    let joke = try await networkService.fetchObject(with: request, responseType: Joke.self)
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
