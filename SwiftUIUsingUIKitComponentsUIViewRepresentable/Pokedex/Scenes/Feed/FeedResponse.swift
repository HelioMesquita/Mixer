//
//  FeedResponse.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class FeedResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [NameURLModel]
    
}

class NameURLModel: Decodable {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
