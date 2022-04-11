//
//  ModelArtsFault.swift
//
//  Created by Shourob Datta on 11/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelArtsFault: Codable {

  enum CodingKeys: String, CodingKey {
    case faultstring
    case detail
  }

  var faultstring: String?
  var detail: ModelArtsDetail?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    faultstring = try container.decodeIfPresent(String.self, forKey: .faultstring)
    detail = try container.decodeIfPresent(ModelArtsDetail.self, forKey: .detail)
  }

}
