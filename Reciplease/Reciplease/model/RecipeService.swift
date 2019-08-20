//
//  recipeService.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire



class RecipeService {
    
    func getCurrentRecipe(currentSearch: String, completion: @escaping (SearchRecipe?) -> Void) {
        Constant.ingredient = currentSearch
       Alamofire.request(Router.searchRecipe).responseData { (response) in
       // let string1 = String(data: response.data!, encoding: String.Encoding.utf8) ?? "Data could not printed"
       // print(string1)
        
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

}


