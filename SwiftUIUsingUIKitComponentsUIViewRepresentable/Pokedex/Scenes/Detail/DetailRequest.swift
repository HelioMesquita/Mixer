//
//  DetailRequest.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class DetailRequest: RequestProtocol {

    var httpVerb: HttpVerbs = .GET
    var id: Int
    var path: String {
        "/api/v2/pokemon/\(id)"
    }
    
    init(id: Int) {
        self.id = id
    }
    
}
