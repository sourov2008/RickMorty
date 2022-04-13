//
//  PhotoSearchByLocationService.swift
//  RickyMorty
//
//  Created by Shourob Datta on 29/1/22.
//

import Foundation


protocol ArticleServiceDelegate {
    
    func getCharacters(path: String, completion: @escaping(Result<ModelArtsBase, NetworkError>) -> Void)
    
}

class CharacterServiceUsingAPI : ArticleServiceDelegate  {
    

    func getCharacters(path: String, completion: @escaping(Result<ModelArtsBase, NetworkError>) -> Void) {
           
        return RestAPIClient.request(type: ModelArtsBase.self,
                                     route: NetworkRouter.nonPaginatedGET(path: path),
                           completion: completion)
    }

}