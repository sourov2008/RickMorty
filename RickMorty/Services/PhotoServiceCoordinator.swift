//
//  PhotoServiceCoordinator.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//
/**
 *  This class called for both MockPhotApiCall(unit teting) & real api call. (DI implemented)
 *  This class actually work as a mediator. Dependency Injection implemented there.
 *
 */
import Foundation

class PhotoServiceCoordinator {

    private let photoServiceMthod: PhotoServiceDelegate
    
    init(photoViewService: PhotoServiceDelegate = PhotoServiceUsingAPI()){
        self.photoServiceMthod = photoViewService
    }
    

    func fetchPhotos(path: String, completion: @escaping(Result<ModelPhotoFlickrBaseClass, NetworkError>) -> Void) {
        
        photoServiceMthod.getPhotos(path: path) { result in
            switch result {
            case .success(let comments):
                
                if comments.stat == "fail"{
                    completion(.failure(.APIError(comments.message ?? "error")))
                    
                }else{

                    completion(result)
                } 
                
            case .failure(let error):
                print(error)
                completion(result)
                
                //NSError(domain:"Data decode error, contact with developer", code:100, userInfo:nil))

            }
        }
        
     }
}
