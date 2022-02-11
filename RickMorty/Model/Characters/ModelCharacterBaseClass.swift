//
//  ModelCharacterBaseClass.swift
//
//  Created by Shourob Datta on 11/2/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelCharacterBaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case info
    case results
    case error

  }

  var info: ModelCharacterInfo?
  var results: [ModelCharacterResults]?
  var error: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    info = try container.decodeIfPresent(ModelCharacterInfo.self, forKey: .info)
    results = try container.decodeIfPresent([ModelCharacterResults].self, forKey: .results)
    error = try container.decodeIfPresent(String.self, forKey: .error)

  }

}
