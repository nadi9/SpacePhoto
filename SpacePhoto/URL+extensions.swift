//
//  URL+extensions.swift
//  SpacePhoto
//
//  Created by Nadezda Panchenko on 22/12/2018.
//  Copyright © 2018 Nadezda Panchenko. All rights reserved.
//

import Foundation

extension URL {
    func withQuery(_ query: [String:String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = query.compactMap({ URLQueryItem(name: $0.0, value: $0.1)})
        return components?.url
    }
}
