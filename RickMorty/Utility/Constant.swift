//
//  Constant.swift
//  HugeClock
//
//  Created by Shourob Datta on 6/12/21.
//

import Foundation


struct Storyboards {
    static let Main = "Main"
}

struct Endpoint {
    
    
    static let imageUrl = "https://farm{farm}.static.flickr.com/{server}/{id}_{secret}.jpg"
   
    static let characterList = "character/?name={search}"
    
    static let characterDetails = "character/{id}"


}

struct userDefaults {
    static let searchHistoryArray =  "searchHistoryArray"

}

 let perPage = Int("10")
 let BASE_URL = "https://rickandmortyapi.com/api/"
 
 

