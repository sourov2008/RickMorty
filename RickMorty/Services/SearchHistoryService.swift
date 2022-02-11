//
//  SearchHistoryService.swift
//  Interview Test
//
//  Created by Shourob Datta on 30/1/22.
//

import Foundation


protocol SearchHistoryServiceDelegate {
    
    func retriveSearchedArray() -> [ModelSearchHistory]
    func saveSearchArray(arr: [ModelSearchHistory])

}


class SearchHistoryService: SearchHistoryServiceDelegate{
    
    
    func retriveSearchedArray() -> [ModelSearchHistory] {
        
        guard let encoded = UserDefaults.standard.object(forKey: userDefaults.searchHistoryArray) as? Data else {
        
            return [ModelSearchHistory]()
            
        }
        let searchArray = try! PropertyListDecoder().decode([ModelSearchHistory].self, from: encoded)

        return searchArray
    }
    
    func saveSearchArray(arr: [ModelSearchHistory]) {
        
        try? UserDefaults.standard.set(PropertyListEncoder().encode(arr), forKey: userDefaults.searchHistoryArray)
        
    }
    
    
 
    
}
