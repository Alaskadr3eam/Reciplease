//
//  recipeService.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire


typealias NetworkRouterCompletion = (_ error: errorMessage?,_ object: SearchRecipe?)->()

class RecipeService {

    private var recipeSession: RecipeSession
    
    init(recipeSession: RecipeSession = RecipeSession()) {
        self.recipeSession = recipeSession
    }

    func getCurrentRecipe(currentSearch: String, completion: @escaping (errorMessage?,SearchRecipe?) -> Void) {
        Constant.ingredient = currentSearch
        let url: URLConvertible!
        url = Router2.searchRecipe
        recipeSession.request(url: url) { data in
            guard data.response?.statusCode == 200 else {
                completion(errorMessage.networkError,nil)
                return
            }
            guard let data = data.data else { return }
           /*     print("badresponse")
                completion(errorMessage.errorNoSource,nil)
                return
            }*/
            guard let searchRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                completion(errorMessage.errorNoSource,nil)
                return
            }
            completion(nil,searchRecipe)
            
        }
    }
    /*func getCurrentRecipe(currentSearch: String, completion: @escaping (SearchRecipe?) -> Void) {
        Constant.ingredient = currentSearch
        Alamofire.request(Router2.searchRecipe).responseData { (response) in
            // let string1 = String(data: response.data!, encoding: String.Encoding.utf8) ?? "Data could not printed"
            // print(string1)
            let response2 = response.response
            switch response.result {
            case .success:
                guard let data = response.data else {
                    print("no data")
                    completion(nil)
                    return
                }
                guard let currentRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                    print("no decode")
                    completion(nil)
                    return
                }
                completion(currentRecipe)
            case .failure:
                guard let error = response.error else { return }
                switch (error._code) {
                case NSURLErrorTimedOut:
                    //Manager your time out error
                    print("Network Timeout !")
                    break
                case NSURLErrorNotConnectedToInternet:
                    //Manager your not connected to internet error
                    print("You're not connected to Internet")
                    break
                default:
                    //manager your default case
                    print(response.error!._code)
                }
            }
        }
    }*/
}

/*class RecipeService2: getRecipe {

    }
    
 /*   private var alamofireRequest: AlamofireRequest
    
    init(alamofireRequest: AlamofireRequest = AlamofireRequest()) {
        self.alamofireRequest = alamofireRequest
    }
    func getCurrentRecipe(currentSearch: String, completion: @escaping NetworkRouterCompletion) {
        Constant.ingredient = currentSearch
        let url: URLConvertible!
        url = Router2.searchRecipe
        alamofireRequest.request(url: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(errorMessage.networkError,nil)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("badresponse")
                completion(errorMessage.errorNoSource,nil)
                return
            }
            guard let searchRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                completion(errorMessage.errorNoSource,nil)
                return
            }
            completion(nil,searchRecipe)
            
        }
    }*/
    


class getRecipe {
    func getCurrentRecipe(currentSearch: String, completion: @escaping NetworkRouterCompletion) {
        Constant.ingredient = currentSearch
        
        Alamofire.request(Router2.searchRecipe).responseData { (response) in
            // let string1 = String(data: response.data!, encoding: String.Encoding.utf8) ?? "Data could not printed"
            // print(string1)
            
            switch response.result {
            case .success:
                guard let data = response.data else {
                    print("no data")
                    completion(errorMessage.errorNoSource, nil)
                    return
                }
                guard let currentRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                    print("no decode")
                    completion(errorMessage.errorNoSource, nil)
                    return
                }
                completion(nil,currentRecipe)
            case .failure:
                guard let error = response.error else { return }
                switch (error._code) {
                case NSURLErrorTimedOut:
                    //Manager your time out error
                    print("Network Timeout !")
                    break
                case NSURLErrorNotConnectedToInternet:
                    //Manager your not connected to internet error
                    print("You're not connected to Internet")
                    break
                default:
                    //manager your default case
                    print(response.error!._code)
                }
            }
    }
}
}
    
 /*   func getCurrentRecipe(currentSearch: String, completion: @escaping (SearchRecipe?) -> Void) {
        Constant.ingredient = currentSearch
       Alamofire.request(Router.searchRecipe).responseData { (response) in
       // let string1 = String(data: response.data!, encoding: String.Encoding.utf8) ?? "Data could not printed"
       // print(string1)
        let response2 = response.response
        switch response.result {
        case .success:
        guard let data = response.data else {
            print("no data")
            completion(nil)
            return
        }
        guard let currentRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
            print("no decode")
            completion(nil)
            return
            }
            completion(currentRecipe)
        case .failure:
        guard let error = response.error else { return }
        switch (error._code) {
        case NSURLErrorTimedOut:
            //Manager your time out error
            print("Network Timeout !")
            break
        case NSURLErrorNotConnectedToInternet:
            //Manager your not connected to internet error
            print("You're not connected to Internet")
            break
        default:
            //manager your default case
            print(response.error!._code)
            }
            }
        }
    }

    func getCurrentImageData(currentURL: String, completion: @escaping (Bool,Data?) -> Void) {
        Constant.urlImage = currentURL
        let url = URL(string: Constant.urlImage)
       
        Alamofire.request(url!).responseData { (data) in
            switch data.result {
            case .success:
                guard let data = data.data else {
                    print("no data")
                    completion(false,nil)
                    return
                }
                completion(true, data)
            case .failure:
            guard let error = data.error else { return }
            switch (error._code) {
            case NSURLErrorTimedOut:
                //Manager your time out error
                print("Network Timeout !")
                break
            case NSURLErrorNotConnectedToInternet:
                //Manager your not connected to internet error
                print("You're not connected to Internet")
                break
            default:
                //manager your default case
                print(data.error!._code)
                }
            }
        }
        
    }

}*/*/


