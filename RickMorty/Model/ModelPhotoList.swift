//
//  PhotoPhotos.swift
//
//  Created by Shourob Datta on 28/1/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelPhotoList: Codable {

  enum CodingKeys: String, CodingKey {
    case photo
    case pages
    case page
    case total
    case perpage
  }

  var photo: [ModelPhotoDetails]?
  var pages: Int?
  var page: Int?
  var total: Int?
  var perpage: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    photo = try container.decodeIfPresent([ModelPhotoDetails].self, forKey: .photo)
    pages = try container.decodeIfPresent(Int.self, forKey: .pages)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    total = try container.decodeIfPresent(Int.self, forKey: .total)
    perpage = try container.decodeIfPresent(Int.self, forKey: .perpage)
  }

}
