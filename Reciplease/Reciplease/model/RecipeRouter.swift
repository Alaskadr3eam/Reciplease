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
enum Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.baseURLPath.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
    
    //static let baseURLString = "https://private-85a46-routable.apiary-mock.com/"
    
    case readUsers
    case createUser(parameters: Parameters)
    case readUser(id: String)
    case updateUser(id: String, parameters: Parameters)
    case destroyUser(id: String)
    case readPosts
    case createPost(parameters: Parameters)
    case readPost(id: String)
    case updatePost(id: String, parameters: Parameters)
    case destroyPost(id: String)

    var method: HTTPMethod {
        switch self {
        case .readUsers,
             .readUser,
             .readPosts,
             .readPost:
            return .get
        case .createUser,
             .createPost:
            return .post
        case .updateUser,
             .updatePost:
            return .put
        case .destroyUser,
             .destroyPost:
            return .delete
        }
    }

    var path: String {
        switch self {
        case .readUsers:
            return "users"
        case .createUser:
            return "users"
        case .readUser(let username):
            return "users/\(username)"
        case .updateUser(let username, _):
            return "users/\(username)"
        case .destroyUser(let username):
            return "users/\(username)"
        case .readPosts:
            return "posts"
        case .createPost:
            return "posts"
        case .readPost(let id):
            return "posts/\(id)"
        case .updatePost(let id, _):
            return "posts/\(id)"
        case .destroyPost(let id):
            return "posts/\(id)"
        }
    }

        var parameters: [String:String] {
            switch self {
            case .ingredient:
                return ["app_id": Constants.appId,
                        "app_key": Constants.appKey,
                        "q": String(),
                        "r": String(),
                        "callback": Constants.formatResponse,
                        "to":"1"]
            default:
                return [:]
            }
        }
    

    
}
enum Constants {
    static let baseURLPath = "https://api.edamam.com"
    // static let authenticationToken = ""
    static let appId = "a62be210"
    static let appKey = "13299fb4f196f5776329da41b4dd7adb"
    static let formatResponse = "JSONP"
}
*/
/*
public enum RecipeRouter: URLRequestConvertible {
    enum Constants {
        static let baseURLPath = "https://api.edamam.com/search"
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
                    "callback": Constants.formatResponse,
                    "to":"1"]
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
