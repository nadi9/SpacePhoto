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
    var description: String
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case description
        case copyright
    }
}
