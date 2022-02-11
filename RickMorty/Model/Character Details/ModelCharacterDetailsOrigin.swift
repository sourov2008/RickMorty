//
//  ModelCharacterDetailsOrigin.swift
//
//  Created by Shourob Datta on 11/2/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelCharacterDetailsOrigin: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case url
  }

  var name: String?
  var url: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    url = try container.decodeIfPresent(String.self, forKey: .url)
  }

}
