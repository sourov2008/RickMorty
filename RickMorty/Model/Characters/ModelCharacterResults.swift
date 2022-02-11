//
//  ModelCharacterResults.swift
//
//  Created by Shourob Datta on 11/2/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelCharacterResults: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case created
    case type
    case name
    case url
    case status
    case location
    case species
    case gender
    case image
    case episode
    case origin
  }

  var id: Int?
  var created: String?
  var type: String?
  var name: String?
  var url: String?
  var status: String?
  var location: ModelCharacterLocation?
  var species: String?
  var gender: String?
  var image: String?
  var episode: [String]?
  var origin: ModelCharacterOrigin?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    created = try container.decodeIfPresent(String.self, forKey: .created)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    location = try container.decodeIfPresent(ModelCharacterLocation.self, forKey: .location)
    species = try container.decodeIfPresent(String.self, forKey: .species)
    gender = try container.decodeIfPresent(String.self, forKey: .gender)
    image = try container.decodeIfPresent(String.self, forKey: .image)
    episode = try container.decodeIfPresent([String].self, forKey: .episode)
    origin = try container.decodeIfPresent(ModelCharacterOrigin.self, forKey: .origin)
  }

}
