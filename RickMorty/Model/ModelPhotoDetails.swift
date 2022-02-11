//
//  PhotoPhoto.swift
//
//  Created by Shourob Datta on 28/1/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelPhotoDetails: Codable {

  enum CodingKeys: String, CodingKey {
    case server
    case farm
    case isfriend
    case isfamily
    case title
    case secret
    case ispublic
    case owner
    case id
  }

  var server: String?
  var farm: Int?
  var isfriend: Int?
  var isfamily: Int?
  var title: String?
  var secret: String?
  var ispublic: Int?
  var owner: String?
  var id: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    server = try container.decodeIfPresent(String.self, forKey: .server)
    farm = try container.decodeIfPresent(Int.self, forKey: .farm)
    isfriend = try container.decodeIfPresent(Int.self, forKey: .isfriend)
    isfamily = try container.decodeIfPresent(Int.self, forKey: .isfamily)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    secret = try container.decodeIfPresent(String.self, forKey: .secret)
    ispublic = try container.decodeIfPresent(Int.self, forKey: .ispublic)
    owner = try container.decodeIfPresent(String.self, forKey: .owner)
    id = try container.decodeIfPresent(String.self, forKey: .id)
  }

}
