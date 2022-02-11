//
//  ModelCharacterInfo.swift
//
//  Created by Shourob Datta on 11/2/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelCharacterInfo: Codable {

  enum CodingKeys: String, CodingKey {
    case count
    case pages
    case prev
    case next
  }

  var count: Int?
  var pages: Int?
  var prev: String?
  var next: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    count = try container.decodeIfPresent(Int.self, forKey: .count)
    pages = try container.decodeIfPresent(Int.self, forKey: .pages)
    prev = try container.decodeIfPresent(String.self, forKey: .prev)
    next = try container.decodeIfPresent(String.self, forKey: .next)
  }

}
