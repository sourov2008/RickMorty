//
//  MockCharacters.swift
//  Interview TestTests
//
//  Created by Shourob Datta on 25/1/22.
//

import XCTest
//@testable import RickMortyTests

class MockCharactersAPITest: XCTestCase {

    func testCharacters() {

        let obj = CharacterServiceCoordinator(characterServiceMthod: MockCharactersData() )
        
        obj.fetchCharacters(path: "local") { [weak self] responseData in

            switch responseData {
            case .success(let res):
                XCTAssert(res.results?.count ?? 0 > 0)

            case .failure(_): break
                //XCTAssert(res.stat == "ok")

            }
        
        }

    }
}
