//
//  FeedModel.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class FeedModel {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
    
    init(count: Int, next: String?, previous: String?, results: [Pokemon]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    class Pokemon: NameURLModel, Identifiable, Equatable {
        
        let id = UUID()
        
        var imageURL: String {
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(String(describing: getId)).png"
        }
        
        var getId: Int {
            var id = url.components(separatedBy: "https://pokeapi.co/api/v2/pokemon/").last ?? ""
            id = String(id.dropLast())
            return Int(id) ?? 0
        }
        
        static func == (lhs: FeedModel.Pokemon, rhs: FeedModel.Pokemon) -> Bool {
            return lhs.id == rhs.id
        }
    }
}
