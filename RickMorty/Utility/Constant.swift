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
    static let photoRetrive = "services/rest/?method=flickr.photos.search&per_page=\(PerPage!)&page={page}&format=json&nojsoncallback=1&safe_search=1&text={text}"
    static let imageUrl = "https://farm{farm}.static.flickr.com/{server}/{id}_{secret}.jpg"

}

struct userDefaults {
    static let searchHistoryArray =  "searchHistoryArray"

}

 let PerPage = Int("10")
 let BASE_URL = "https://api.flickr.com/"
 let ACCESSTOKEN = "5470a9f4561e355ef4186d493c4ee11d"

 

