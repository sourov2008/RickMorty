//
//  RestAPIClient.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//
/**
 *  This class is responsible for network call. We will make network request.
 *  Using URLRequestConvertible by Alamofire
 *
 */

import Foundation
import Alamofire



class RestAPIClient {
    
    
    static func request<T: Codable>(type: T.Type,
                                    route:NetworkRouter,
                                    completion: @escaping(Result<T,NetworkError>) -> Void) {
        AF.request(route).response { response in
            
            DispatchQueue.main.async {
                let result = response.result
                switch result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(.NoData("Error: No data found")))
                        return
                    }
                    guard let obj = try? JSONDecoder().decode(T.self, from: data) else {
                        completion(.failure(.DecodingError("Error: Decoding error.Contact with developer")))
                        return
                    }

                    completion(.success(obj))
                    
                case .failure(let error):
                    
                    completion(.failure(.APIError(error.localizedDescription)))
                }
            }
            
        }
    }
 
}
