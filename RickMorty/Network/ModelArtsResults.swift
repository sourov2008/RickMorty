//
//  ModelArtsResults.swift
//
//  Created by Shourob Datta on 11/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ModelArtsResults: Codable {

  enum CodingKeys: String, CodingKey {
    case updatedDate = "updated_date"
    case abstract
    case kicker
    case subsection
    case orgFacet = "org_facet"
    case materialTypeFacet = "material_type_facet"
    case section
    case desFacet = "des_facet"
    case title
    case url
    case publishedDate = "published_date"
    case createdDate = "created_date"
    case multimedia
    case perFacet = "per_facet"
    case byline
    case shortUrl = "short_url"
    case uri
    case geoFacet = "geo_facet"
    case itemType = "item_type"
  }

  var updatedDate: String?
  var abstract: String?
  var kicker: String?
  var subsection: String?
  var orgFacet: [String]?
  var materialTypeFacet: String?
  var section: String?
  var desFacet: [String]?
  var title: String?
  var url: String?
  var publishedDate: String?
  var createdDate: String?
  var multimedia: [ModelArtsMultimedia]?
  var perFacet: [String]?
  var byline: String?
  var shortUrl: String?
  var uri: String?
  var geoFacet: [String]?
  var itemType: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    updatedDate = try container.decodeIfPresent(String.self, forKey: .updatedDate)
    abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
    kicker = try container.decodeIfPresent(String.self, forKey: .kicker)
    subsection = try container.decodeIfPresent(String.self, forKey: .subsection)
    orgFacet = try container.decodeIfPresent([String].self, forKey: .orgFacet)
    materialTypeFacet = try container.decodeIfPresent(String.self, forKey: .materialTypeFacet)
    section = try container.decodeIfPresent(String.self, forKey: .section)
    desFacet = try container.decodeIfPresent([String].self, forKey: .desFacet)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
    createdDate = try container.decodeIfPresent(String.self, forKey: .createdDate)
    multimedia = try container.decodeIfPresent([ModelArtsMultimedia].self, forKey: .multimedia)
    perFacet = try container.decodeIfPresent([String].self, forKey: .perFacet)
    byline = try container.decodeIfPresent(String.self, forKey: .byline)
    shortUrl = try container.decodeIfPresent(String.self, forKey: .shortUrl)
    uri = try container.decodeIfPresent(String.self, forKey: .uri)
    geoFacet = try container.decodeIfPresent([String].self, forKey: .geoFacet)
    itemType = try container.decodeIfPresent(String.self, forKey: .itemType)
  }

}
