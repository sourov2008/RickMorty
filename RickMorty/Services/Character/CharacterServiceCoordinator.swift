//
//  CharacterServiceCoordinator.swift
//
//  Created by Shourob Datta on 29/1/22.
//
/**
 *  This class called for both Mock (unit teting) & real api call.
 *  This class actually work as a mediator. Dependency Injection implemented there.
 *
 */
import Foundation

class CharacterServiceCoordinator {

    private let characterServiceMethod: CharacterServiceDelegate
    
    init(characterServiceMthod: CharacterServiceDelegate = CharacterServiceUsingAPI()){
        self.characterServiceMethod = characterServiceMthod
    }
    
    func fetchCharacters(path: String, completion: @escaping( _ response:ModelCharacterBaseClass?,  _ success: Bool, _ error: String?) -> Void) {
        
        characterServiceMethod.getCharacters(path: path) { result in
            switch result {
            case .success(let details):
                
                if details.error != nil {
                    completion(nil, false, details.error ?? "error")
                }else{
                    completion(details, true, nil)
                }
                
            case .failure(let error):
                completion(nil, false, error.localizedDescription )

 
            }
        }
        
     }
}
