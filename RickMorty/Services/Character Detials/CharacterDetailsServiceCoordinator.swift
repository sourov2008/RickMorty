//
//  CharacterDetailsServiceCoordinator.swift
//  RickMorty
//
//  Created by Shourob Datta on 11/2/22.
//

import Foundation

 
class CharacterDetailsServiceCoordinator {

    private let characterDetailsServiceMthod: CharacterDetailsServiceDelegate
    
    init(characterDetailsViewService: CharacterDetailsServiceDelegate = CharacterDetailsServiceAPI()){
        self.characterDetailsServiceMthod = characterDetailsViewService
    }
    

    func fetchCharacterDetails(path: String, completion: @escaping( _ response:ModelCharacterDetailsBaseClass?,  _ success: Bool, _ error: String?) -> Void) {
        
        characterDetailsServiceMthod.getCharacterDetails(path: path) { result in
            switch result {
            case .success(let character):
                
                if character.error != nil {
                    completion(nil, false, character.error ?? "error")
                    
                }else{
                    completion(character, true, nil)
                }
                
            case .failure(let error):
                completion(nil, false, error.localizedDescription )
                
 
            }
        }
        
     }
}
