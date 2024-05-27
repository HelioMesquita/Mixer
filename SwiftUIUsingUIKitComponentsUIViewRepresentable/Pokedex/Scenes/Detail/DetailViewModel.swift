//
//  DetailViewModel.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

protocol DetailViewModelProtocol {
    var detailPokemon: DetailModel? { get set }
    func loadDetail()
}

@Observable
class DetailViewModel: DetailViewModelProtocol {
    
    var pokemon: FeedModel.Pokemon
    let service: ServiceProtocol
    
    var detailPokemon: DetailModel?
    
    init(pokemon: FeedModel.Pokemon, service: ServiceProtocol = Service()) {
        self.service = service
        self.pokemon = pokemon
    }
    
    func loadDetail() {
        Task { @MainActor in
            do {
                let pokemon = try await service.execute(DetailRequest(id: pokemon.getId), builder: DetailBuilder())
                detailPokemon = pokemon
                print(pokemon)
            } catch {
                print("Error when loading pokemons. Code: \(error.localizedDescription)")
            }
        }
    }
    
}

