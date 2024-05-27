//
//  DetailModel.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class DetailModel: Identifiable {
    let name: String
    let order: Int
    let weight: Double
    let types: [PokemonType]
    let abilities: [PokemonAbility]
    let stats: [PokemonStats]
    let image: String
    let height: Double
    
    var getWeight: String {
        return (weight/10).formatted() + " Kg"
    }
    
    var getHeight: String {
        return (height*10).formatted() + " cm"
    }
    
    init(name: String, 
         order: Int,
         weight: Double,
         types: [PokemonType],
         abilities: [PokemonAbility],
         stats: [PokemonStats],
         image: String,
         height: Double) {
        self.name = name
        self.order = order
        self.weight = weight
        self.types = types
        self.abilities = abilities
        self.stats = stats
        self.image = image
        self.height = height
    }
    
    class PokemonType: Identifiable {
        let name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    class PokemonAbility: Identifiable {
        let name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    class PokemonStats: Identifiable {
        let base: Double
        let name: String
        
        init(base: Double, name: String) {
            self.base = base
            self.name = name
        }
    }
    
}
