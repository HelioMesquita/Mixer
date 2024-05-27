//
//  FeedBuilder.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class FeedBuilder: BuilderProtocol {
    
    func build(response: FeedResponse) throws -> FeedModel {
        return FeedModel(count: response.count,
                           next: response.next,
                           previous: response.previous,
                           results: response.results.compactMap({ FeedModel.Pokemon(name: $0.name, url: $0.url) }))
    }
    
}
