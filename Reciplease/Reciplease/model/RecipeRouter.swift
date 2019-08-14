//
//  RecipeRouter.swift
//  Reciplease
//
//  Created by Clément Martin on 24/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire
/*
public enum RecipeRouter: URLRequestConvertible {
    enum Constants {
        static let baseURLPath = "https://api.edamam.com"
       // static let authenticationToken = ""
        static let appId = "a62be210"
        static let appKey = "13299fb4f196f5776329da41b4dd7adb"
        static let formatResponse = "JSONP"
    }
    struct Ingredients {
        let name: [String]
    }
    
    case content
    case ingredient

    
    var method: HTTPMethod {
        switch self {
        case .content:
            return .post
        case .ingredient:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .content:
            return "/content"
        case .ingredient:
            return "/search"
        }
    }

   /* var parameters: [String:String] =
        ["app_id": Constants.appId,
         "app_key": Constants.appKey,
         "q": String(),
         "r": String(),
         "callback": Constants.formatResponse]
       */
    
    var parameters: [String: String] {
        switch self {
        case .ingredient:
            return ["app_id": Constants.appId,
                    "app_key": Constants.appKey,
                    "q": String(),
                    "r": String(),
                    "callback": Constants.formatResponse]
        default:
            return [:]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURLPath.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
 */
