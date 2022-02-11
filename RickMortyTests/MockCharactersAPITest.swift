//
//  MockCharacters.swift
//  RickyMorty 
//
//  Created by Shourob Datta on 25/1/22.
//

import XCTest
//@testable import RickMortyTests

class MockCharactersAPITest: XCTestCase {

    func testCharacters() {

        let obj = CharacterServiceCoordinator(characterServiceMthod: MockCharactersData() )
        
        obj.fetchCharacters(path: "local") { [weak self] response,success,error  in

            
            guard success == true && response != nil else{
                //self?.showToast(message: error ?? "error", font: UIFont.systemFont(ofSize: 12))
                 return
            }
            
            XCTAssert(response?.results?.count ?? 0 > 0)
        
        
        }

    }
}
