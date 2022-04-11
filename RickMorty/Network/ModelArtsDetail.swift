//
//  ModelArtsDetail.swift
//
//  Created by Shourob Datta on 11/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelArtsDetail: Codable {

  enum CodingKeys: String, CodingKey {
    case errorcode
  }

  var errorcode: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    errorcode = try container.decodeIfPresent(String.self, forKey: .errorcode)
  }

}
