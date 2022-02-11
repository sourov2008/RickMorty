//
//  ModelCharacterDetailsBaseClass.swift
//
//  Created by Shourob Datta on 11/2/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelCharacterDetailsBaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case episode
    case location
    case created
    case url
    case status
    case species
    case gender
    case type
    case origin
    case image
    case name
    case id
    case error

  }

  var episode: [String]?
  var location: ModelCharacterDetailsLocation?
  var created: String?
  var url: String?
  var status: String?
  var species: String?
  var gender: String?
  var type: String?
  var origin: ModelCharacterDetailsOrigin?
  var image: String?
  var name: String?
  var id: Int?
  var error: String?


  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    episode = try container.decodeIfPresent([String].self, forKey: .episode)
    location = try container.decodeIfPresent(ModelCharacterDetailsLocation.self, forKey: .location)
    created = try container.decodeIfPresent(String.self, forKey: .created)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    species = try container.decodeIfPresent(String.self, forKey: .species)
    gender = try container.decodeIfPresent(String.self, forKey: .gender)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    origin = try container.decodeIfPresent(ModelCharacterDetailsOrigin.self, forKey: .origin)
    image = try container.decodeIfPresent(String.self, forKey: .image)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    error = try container.decodeIfPresent(String.self, forKey: .error)

  }

}
