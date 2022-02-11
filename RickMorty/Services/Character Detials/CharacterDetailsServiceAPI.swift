//
//  CharacterDetailsServiceAPI.swift
//  RickMorty
//
//  Created by Shourob Datta on 11/2/22.
//

import Foundation


protocol CharacterDetailsServiceDelegate {
    
    func getCharacterDetails(path: String, completion: @escaping(Result<ModelCharacterDetailsBaseClass, NetworkError>) -> Void)
    
}

class CharacterDetailsServiceAPI : CharacterDetailsServiceDelegate  {
    

    func getCharacterDetails(path: String, completion: @escaping(Result<ModelCharacterDetailsBaseClass, NetworkError>) -> Void) {
           
        return RestAPIClient.request(type: ModelCharacterDetailsBaseClass.self,
                                     route: NetworkRouter.nonPaginatedGET(path: path),
                           completion: completion)
    }

}
