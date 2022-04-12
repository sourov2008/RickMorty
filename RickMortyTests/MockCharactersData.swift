//
//  MockCharactersData.swift
//  RickyMorty
//
//  Created by Shourob Datta on 06/01/22.
//

import Foundation
//@testable import RickMortyTests

class MockCharactersData: CharacterServiceDelegate {
 
    
    func getCharacters(path: String, completion: @escaping (Result<ModelArtsBase, NetworkError>) -> Void) {
        guard let jsonData = readLocalJsonFile() else {
            completion(.failure(.NoData("")))
            return
        }
        do {
            let obj = try  JSONDecoder().decode(ModelArtsBase.self, from: jsonData)
            completion(.success(obj))
        } catch _ {
            completion(.failure(.DecodingError("")))
        }
    }
    
 
    private func readLocalJsonFile() -> Data? {
        do {
            guard let fileUrl =  Bundle.main.url(forResource: "MockArtsList", withExtension: "json") else {
                return nil
            }
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
