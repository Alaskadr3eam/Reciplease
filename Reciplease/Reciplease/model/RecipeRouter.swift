//
//  RecipeRouter.swift
//  Reciplease
//
//  Created by Clément Martin on 24/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire

/*enum Router: URLRequestConvertible {
  /*  func asURLRequest() throws -> URLRequest? {
        let url = try Constant.baseURLPath.asURL()
        let urlPath = URL(fileURLWithPath: self.path)
        let urlPath2 = URL(url: url.appendPathComponent(path))
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var items = [URLQueryItem]()
        // let param = parametersRequest.
        /*
         for (key,value) in param {
         let queryItem = URLQueryItem(name: key, value: value)
         items.append(queryItem)
         }*/
        urlComponents?.queryItems = items
        let urlComplete = urlComponents?.url
        guard let urlSecure = urlComplete else { return nil }
        let request = URLRequest(url: urlSecure)
        return request
    }*/
    
   func asURLRequest() throws -> URLRequest {
        let url = try Constant.baseURLPath.asURL()
    var urlComponents = URLComponents(url:url, resolvingAgainstBaseURL: true)
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
    
    
    
    //static let baseURLString = "https://private-85a46-routable.apiary-mock.com/"
    case searchRecipe

    var method: HTTPMethod {
        switch self {
        case .searchRecipe:
            return .get
    }

    var path: String {
        switch self {
        case .searchRecipe:
            return "search"
        }
    }

        var parametersRequest: [String:String] {
            switch self {
            case .searchRecipe:
                return ["app_id": Constants.appId,
                        "app_key": Constants.appKey,
                        "q": String(),
                        "r": String(),
                        "callback": Constants.formatResponse,
                        "to":"1"]
        }
    
    var headers: HTTPHeaders {
        switch self {
        case .searchRecipe:
            return ["Accept": "application/json",
                "Content-Type" :"application/json"]
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
*/
enum Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let urlString = URL(string: Constant.baseURL)
        let urlPath = urlString!.appendingPathComponent(path)
        var urlComponent = URLComponents(url: urlPath, resolvingAgainstBaseURL: true)
        var items = [URLQueryItem]()
        let params1 = param1
        for (key,value) in params1 {
            let queryItem = URLQueryItem(name: key, value: value)
            items.append(queryItem)
        }
        let params = param
        for (key,value) in params {
            let queryItem = URLQueryItem(name: key, value: value)
            items.append(queryItem)
        }
        urlComponent?.queryItems = items
        let urlComplete = urlComponent?.url
        var request = URLRequest(url: urlComplete!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
        
    }
    
    static let baseURLString = Constant.baseURL
    
    case searchRecipe
    
    
    var method: HTTPMethod {
        switch self {
        case .searchRecipe:
            return .get
        
        }
    }
    
    var path: String {
        switch self {
        case .searchRecipe:
            return "search"
        
        }
    }
    
    var param1: [String:String] {
        switch self {
        case .searchRecipe:
            return ["app_id": Constant.appId]
        
        }
    }
    
    var param: [String:String] {
        switch self {
        case .searchRecipe:
            return ["app_key": Constant.appKey,
                    "q": Constant.ingredient,
                    "r": String(),
                    "to":Constant.numberResult]
       
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .searchRecipe:
            return ["Accept": "application/json",
                    "Content-Type" :"application/json"]
        }
    }
    
}
