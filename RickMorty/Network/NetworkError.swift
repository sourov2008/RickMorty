//
//  NetworkError.swift
//  Interview Test
//
//  Created by Shourob Datta on 30/1/22.
//

import Foundation

enum NetworkError: Error {
    case BadURL(String)
    case NoData(String)
    case DecodingError(String)
    case APIError(String)

}
