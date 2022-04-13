//
//  ModelArtsModelArtsBase.swift
//
//  Created by Shourob Datta on 11/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelArtsBase: Codable {

  enum CodingKeys: String, CodingKey {
    case results
    case status
    case lastUpdated = "last_updated"
    case numResults = "num_results"
    case section
    case fault
    case copyright
  }

  var results: [ModelArtsResults]?
  var status: String?
  var lastUpdated: String?
  var numResults: Int?
  var section: String?
  var fault: ModelArtsFault?
  var copyright: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    results = try container.decodeIfPresent([ModelArtsResults].self, forKey: .results)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    lastUpdated = try container.decodeIfPresent(String.self, forKey: .lastUpdated)
    numResults = try container.decodeIfPresent(Int.self, forKey: .numResults)
    section = try container.decodeIfPresent(String.self, forKey: .section)
    fault = try container.decodeIfPresent(ModelArtsFault.self, forKey: .fault)
    copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
  }

}
