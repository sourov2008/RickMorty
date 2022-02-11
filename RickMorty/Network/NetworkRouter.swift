//
//  NetworkRouter.swift
//
//
//  Created by Shourob Datta on 29/1/22.
 //
/**
 *  Setup your own URLRequestConvertible Network router.
 */
import Foundation
import Alamofire


enum NetworkRouter: URLRequestConvertible {
    
    
    case paginatedGET(path: String)
    case post([String: Any])
    case delete(Int)
    case update([String: Any])


    
    func asURLRequest() throws -> URLRequest {
   
        var method: HTTPMethod{
            switch self {
            case .paginatedGET:
                return .get
            case .post:
                return .post
            case .delete:
                return .delete
            case .update:
                return .put
            }
        }
        
        
        let params: ([String: Any]?) = {
            switch self {
            case .paginatedGET, .delete:
                return nil
            case .post(let newTodo):
                return newTodo
                
            case .update(let newTodo):
                return newTodo
            }
   
        }()
        
        
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
             case .post:
                relativePath = "REPLACE"
            case .delete(let number):
                relativePath = "REPLACE/\(number)"
            case .update(let number):
                relativePath = "todos/\(number)"
            case .paginatedGET(let path):
                relativePath = path


            }

            
            var url = URL(string: BASE_URL)!
            if let relativePath = relativePath {
//                let accessKey = "&appid={access_key}".replacingOccurrences(of: "{access_key}", with: ACCESSTOKEN)
                let api_key = ACCESSTOKEN

                let fullUrl = BASE_URL+relativePath+"&api_key=\(api_key)"
                let encodedURL = fullUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

                url = URL(string: encodedURL!)!
                
            }
            return url
            
            
        }()
        

        var headers: HTTPHeaders {
            let header = HTTPHeaders()
            
            // Set your own custom header
            return header
            
        }
        
        
        var urlRequest: URLRequest {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
//            headers.forEach {
//                request.addValue($1, forHTTPHeaderField: $0)
//            }
            request.setValue("application/json", forHTTPHeaderField: "Accept")//set special header value
            
            return request
        }




        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        
        return try encoding.encode(urlRequest, with: params)

    
    }
    
}
