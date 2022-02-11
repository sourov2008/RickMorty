//
//  SearchValidationService.swift
//  Interview Test
//
//  Created by Shourob Datta on 30/1/22.
//

import Foundation
import SwiftUI
import Alamofire

struct SearchValidationService {
    
    func validiateSearch(text: String?) throws -> String {
        
        guard let searchString = text else{
            throw SearchValidationError.invalidValue
        }

        guard searchString.trimmingCharacters(in: .whitespaces).isEmpty == false else {
            throw SearchValidationError.emptyValue
        }

        
        return searchString
    }
}


enum SearchValidationError: LocalizedError {
   
    case invalidValue
    case emptyValue
    
    
    var errorDescription: String? {
        
        switch self {
        case .invalidValue:
            return "You entered a invalid value"
        case .emptyValue:
            return "Please type a valid text"
        }
    }
    
}
