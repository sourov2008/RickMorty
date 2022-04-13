//
//  ModelArtsMultimedia.swift
//
//  Created by Shourob Datta on 11/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelArtsMultimedia: Codable {

  enum CodingKeys: String, CodingKey {
    case caption
    case copyright
    case height
    case url
    case type
    case format
    case subtype
    case width
  }

  var caption: String?
  var copyright: String?
  var height: Int?
  var url: String?
  var type: String?
  var format: String?
  var subtype: String?
  var width: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    caption = try container.decodeIfPresent(String.self, forKey: .caption)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
    height = try container.decodeIfPresent(Int.self, forKey: .height)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    format = try container.decodeIfPresent(String.self, forKey: .format)
    subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
    width = try container.decodeIfPresent(Int.self, forKey: .width)
  }

}
