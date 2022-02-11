//
//  PhotoFlickrBaseClass.swift
//
//  Created by Shourob Datta on 28/1/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelPhotoFlickrBaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case stat
    case photos
    case code
    case message
  }

  var stat: String?
  var photos: ModelPhotoList?
  var code: Int?
  var message: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    stat = try container.decodeIfPresent(String.self, forKey: .stat)
    photos = try container.decodeIfPresent(ModelPhotoList.self, forKey: .photos)
    code = try container.decodeIfPresent(Int.self, forKey: .code)
    message = try container.decodeIfPresent(String.self, forKey: .message)

  }

}
