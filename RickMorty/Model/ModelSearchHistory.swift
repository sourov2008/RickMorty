//
//  ModelSearchHistory.swift
//  RickyMorty
//
//  Created by Shourob Datta on 30/1/22.
//

import Foundation


class ModelSearchHistory: Codable {

  enum CodingKeys: String, CodingKey {

    case searachTitle = "searachTitle"
    case date = "date"
   }

    var searachTitle: String?
    var date: Date?
 
  init (  searchTitle: String?,  date: Date? ) {
     self.searachTitle = searchTitle
     self.date = date
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
      date = try container.decodeIfPresent(Date.self, forKey: .date)
      searachTitle = try container.decodeIfPresent(String.self, forKey: .searachTitle)
   }

}
