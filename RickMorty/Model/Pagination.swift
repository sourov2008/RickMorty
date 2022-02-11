//
//  Pagination.swift
//
//  Created by Shourob Datta on 29/1/22
//  Copyright (c) . All rights reserved.
//

//import Foundation
//
//struct Pagination: Codable {
//
//  enum CodingKeys: String, CodingKey {
//
////      "page": 2,
////      "pages": 47270,
////      "perpage": 10,
////      "total": 472696,
//
//    case page // current page
//    case pages // available page
//    case total // total page
//    case perpage // per page
//  }
//
//  var page: Int?
//  var pages: Int?
//  var total: Int?
//  var perpage: Int?
//
//
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    page = try container.decodeIfPresent(Int.self, forKey: .page)
//    pages = try container.decodeIfPresent(Int.self, forKey: .pages)
//    total = try container.decodeIfPresent(Int.self, forKey: .total)
//    perpage = try container.decodeIfPresent(Int.self, forKey: .perpage)
//  }
//
//}


import Foundation

class Pagination: Codable {

  enum CodingKeys: String, CodingKey {

    case pageCount = "pages"
    case count = "total"
    case currentPage = "page"
  }

   var pageCount: Int?
   var count: Int?
  var currentPage: Int?

  init (  pageCount: Int?,  count: Int?, currentPage: Int?) {
     self.pageCount = pageCount
     self.count = count
    self.currentPage = currentPage
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
     pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
     count = try container.decodeIfPresent(Int.self, forKey: .count)
    currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
  }

}
