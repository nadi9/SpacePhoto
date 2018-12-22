//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Nadezda Panchenko on 22/12/2018.
//  Copyright © 2018 Nadezda Panchenko. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    
    var url: URL
    var title: String
    var description: String
    var copyright: String?
    var media: String
    
    enum CodingKeys: String, CodingKey {
        case description = "explanation"
        case url
        case copyright
        case title
        case media = "media_type"
    }
}
