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
    let recipeBaseUrl = URL(string: Constant.baseURLPath)

    var parameters: [String:String] =
        ["app_id": Constant.appId,
         "app_key": Constant.appKey,
         "q": String(),
         "r": String(),
         "callback": Constant.formatResponse,
         "to": "1"]

    typealias WebResponseService = (CurrentRecipe?, Error?) -> Void

    
    func getCurrentRiver(currentSearch: String, completion: @escaping (CurrentRecipe?) -> Void) {
        parameters["q"] = currentSearch
        if let recipeBaseUrl = URL(string: Constant.baseURLPath) {
            let request = CreateReaquest.createRequest(url: recipeBaseUrl, arguments: parameters)
            Alamofire.request(request!).responseJSON(completionHandler: { (response) in
                
                if (response.result.isSuccess) {
        
                    if let jsonRecipe = response.result.value as? CurrentRecipe {
                            let currentRecipe = jsonRecipe
                            completion(currentRecipe)
                        } else {
                            completion(nil)
                        }
                    } else if (response.result.isFailure) {
                    //Manager your error
                  if let error = response.error {
                    switch (error._code){
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
            })
        }
        
    }

}
