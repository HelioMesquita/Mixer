//
//  DetailBuilder.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class DetailBuilder: BuilderProtocol {
    
    func build(response: DetailResponse) throws -> DetailModel {
        let types = response.types.compactMap({ DetailModel.PokemonType(name: $0.type.name) })
        let abilities = response.abilities.compactMap({ DetailModel.PokemonAbility(name: $0.ability.name) })
        let stats = response.stats.compactMap({ DetailModel.PokemonStats(base: $0.base_stat, name: $0.stat.name) })
        
        return DetailModel(name: response.name, order: response.order, weight: response.weight, types: types, abilities: abilities, stats: stats, image: response.sprites.other.officialArtwork.frontDefault, height: response.height)
    }
}
