//
//  RequestProvider.swift
//  Swiftmazing
//
//  Created by Hélio Mesquita on 14/12/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

extension RequestProtocol {

  var scheme: String {
    return "https"
  }

  var host: String {
    return "pokeapi.co"
  }

  var bodyParameters: Encodable? {
    return nil
  }

  var queryParameters: [URLQueryItem]? {
    return nil
  }

  var headers: [String: String] {
    return ["Content-Type": "application/json"]
  }

}
