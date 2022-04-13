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

class ArticleServiceViewModel {

    private let characterServiceMethod: ArticleServiceDelegate
    
    init(characterServiceMthod: ArticleServiceDelegate = CharacterServiceUsingAPI()){
        self.characterServiceMethod = characterServiceMthod
    }
    
    func fetchCharacters(path: String, completion: @escaping( _ response:ModelArtsBase?,  _ success: Bool, _ error: String?) -> Void) {
        
        characterServiceMethod.getCharacters(path: path) { result in
            switch result {
            case .success(let details):
                
                if details.fault != nil {
                    completion(nil, false, details.fault?.faultstring ?? "error")
                }else{
                    completion(details, true, nil)
                }
                
            case .failure(let error):
                completion(nil, false, error.localizedDescription )

 
            }
        }
        
     }
}
