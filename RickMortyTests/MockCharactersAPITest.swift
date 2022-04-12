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
                 return
            }
            
            XCTAssert(response?.status ==  "OK")
        
        
        }

    }
}
