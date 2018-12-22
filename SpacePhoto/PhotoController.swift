//
//  PhotoController.swift
//  SpacePhoto
//
//  Created by Nadezda Panchenko on 22/12/2018.
//  Copyright © 2018 Nadezda Panchenko. All rights reserved.
//

import Foundation

class PhotoController {
    let query = [
        "api_key": "DEMO_KEY"
    ]
    
    func fetchPhoto(completion: @escaping(PhotoInfo?)->Void ) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")
        guard let url = baseURL?.withQuery(query) else {
            print("Could not create a url with query")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let data = data, let photo = try? JSONDecoder().decode(PhotoInfo.self, from: data) {
                completion(photo)
                } else {
                print("Error: either no data fetched or data was serialised properly")
                completion(nil)
            }
        }
        task.resume()
    }
}
