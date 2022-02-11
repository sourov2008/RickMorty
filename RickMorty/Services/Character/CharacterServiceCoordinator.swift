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
    

    func fetchCharacters(path: String, completion: @escaping(Result<ModelCharacterBaseClass, NetworkError>) -> Void) {
        
        characterServiceMethod.getCharacters(path: path) { result in
            switch result {
            case .success(let character):
                
                if character.error != nil {
                    completion(.failure(.APIError(character.error ?? "error")))
                    
                }else{

                    completion(result)
                } 
                
            case .failure(let error):
                print(error)
                completion(result)
                
 
            }
        }
        
     }
}
