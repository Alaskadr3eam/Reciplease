//
//  RecipeRouter.swift
//  Reciplease
//
//  Created by Clément Martin on 24/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire

enum Router2: URLConvertible {
    func asURL() throws -> URL {
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
        return urlComplete!
    }

    static let baseURLString = Constant.baseURL
    
    case searchRecipe, searchTest
    
    
  /*  var method: HTTPMethod {
        switch self {
        case .searchRecipe:
            return .get
            
        }
    }*/
    
    var path: String {
        switch self {
        case .searchRecipe:
            return "search"
        case .searchTest:
            return "search"
        }
    }
    
    var param1: [String:String] {
        switch self {
        case .searchRecipe:
            return ["app_id": Constant.appId]
        case.searchTest:
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
        case.searchTest:
            return ["app_key": Constant.appKey,
                    "q": Constant.ingredient,
                    "r": String(),
                    "to":Constant.numberResult]
            
        }
    }
    
 /*   var headers: HTTPHeaders {
        switch self {
        case .searchRecipe:
            return ["Accept": "application/json",
                    "Content-Type" :"application/json"]
        }
    }*/
    
    
}
/*enum Router: URLRequestConvertible {
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
    
}*/
