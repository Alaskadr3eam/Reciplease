//
//  CreateRequest.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

class CreateReaquest {
    static func createRequest(url: URL, arguments: [String:String]) -> URLRequest? {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var items = [URLQueryItem]()
        let param = arguments
        for (key,value) in param {
            let queryItem = URLQueryItem(name: key, value: value)
            items.append(queryItem)
        }
        urlComponents?.queryItems = items
        let urlComplete = urlComponents?.url
        guard let urlSecure = urlComplete else { return nil }
        return URLRequest(url: urlSecure)
    }
}
