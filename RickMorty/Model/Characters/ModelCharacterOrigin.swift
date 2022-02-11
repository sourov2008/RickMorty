//
//  ModelCharacterOrigin.swift
//
//  Created by Shourob Datta on 11/2/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelCharacterOrigin: Codable {

  enum CodingKeys: String, CodingKey {
    case url
    case name
  }

  var url: String?
  var name: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}
