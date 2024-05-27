//
//  FeedViewModel.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

protocol FeedViewModelProtocol {
    var list: [FeedModel.Pokemon] { get set }
    
    func loadPokemons()
    func handleNextPage(pokemon: FeedModel.Pokemon)
}

@Observable
class FeedViewModel: FeedViewModelProtocol {
    
    var currentPage = 0
    var hasNextPage = false
    var list: [FeedModel.Pokemon] = []
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func loadPokemons() {
        guard list.isEmpty else { return }
        fetchPokemonList()
    }
    
    func fetchPokemonList() {
        Task { @MainActor in
            do {
                let pokemonFeed = try await service.execute(FeedRequest(page: currentPage), builder: FeedBuilder())
                hasNextPage = pokemonFeed.next != nil
                list.append(contentsOf: pokemonFeed.results)
            } catch {
                print("Error when loading pokemons. Code: \(error.localizedDescription)")
            }
        }
    }
    
    func handleNextPage(pokemon: FeedModel.Pokemon) {
        if pokemon == list.last && hasNextPage {
            currentPage += 1
            fetchPokemonList()
        }
    }
}
