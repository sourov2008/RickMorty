//
//  PhotoSearchByLocationService.swift
//  Interview Test
//
//  Created by Shourob Datta on 29/1/22.
//

import Foundation


protocol PhotoServiceDelegate {
    
    func getPhotos(path: String, completion: @escaping(Result<ModelPhotoFlickrBaseClass, NetworkError>) -> Void)
    
}

class PhotoServiceUsingAPI : PhotoServiceDelegate  {
    

    func getPhotos(path: String, completion: @escaping(Result<ModelPhotoFlickrBaseClass, NetworkError>) -> Void) {
           
        return RestAPIClient.request(type: ModelPhotoFlickrBaseClass.self,
                                     route: NetworkRouter.paginatedGET(path: path),
                           completion: completion)
    }

}
