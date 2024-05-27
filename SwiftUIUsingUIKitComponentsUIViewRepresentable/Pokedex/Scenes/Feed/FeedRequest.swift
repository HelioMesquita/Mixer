//
//  FeedRequest.swift
//  pokedex
//
//  Created by Hélio Mesquita on 21/05/24.
//

import Foundation

class FeedRequest: RequestProtocol {
    
    var httpVerb: HttpVerbs = .GET
    var path: String = "/api/v2/pokemon"
    var page: Int
    private let numberOfElements = 40
    
    var queryParameters: [URLQueryItem]? {
        return [
            URLQueryItem(name: "offset", value: "\(numberOfElements * page)"),
            URLQueryItem(name: "limit", value: "\(numberOfElements)")
        ]
    }
    
    init(page: Int = 0) {
        self.page = page
    }
    
}
