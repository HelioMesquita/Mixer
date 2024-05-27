//
//  DetailResponse.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class DetailResponse: Decodable {
    let name: String
    let order: Int
    let weight: Double
    let stats: [StatsResponse]
    let types: [TypesResponse]
    let abilities: [AbilitiesResponse]
    let sprites: SpriteResponse
    let height: Double
    
    class StatsResponse: Decodable {
        let base_stat: Double
        let stat: NameURLModel
    }

    class TypesResponse: Decodable {
        let type: NameURLModel
    }

    class AbilitiesResponse: Decodable {
        let ability: NameURLModel
    }
    
    class SpriteResponse: Decodable {
        let other: OthersResponse
    }
    
    class OthersResponse: Decodable {
        let officialArtwork: OfficialArtwork
        
        enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }
    
    class OfficialArtwork: Decodable {
        let frontDefault: String
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }

}
