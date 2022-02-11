//
//  PhotoSearchByLocationService.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//

import Foundation


protocol CharacterServiceDelegate {
    
    func getCharacters(path: String, completion: @escaping(Result<ModelCharacterBaseClass, NetworkError>) -> Void)
    
}

class CharacterServiceUsingAPI : CharacterServiceDelegate  {
    

    func getCharacters(path: String, completion: @escaping(Result<ModelCharacterBaseClass, NetworkError>) -> Void) {
           
        return RestAPIClient.request(type: ModelCharacterBaseClass.self,
                                     route: NetworkRouter.nonPaginatedGET(path: path),
                           completion: completion)
    }

}
