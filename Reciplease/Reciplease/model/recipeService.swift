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
    
    let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Content-Type" :"application/json"
    ]

   

    //https://api.edamam.com/search?app_id=a62be210&app_key=13299fb4f196f5776329da41b4dd7adb&to=1&q=chicken,tomate&r=&callback=JSONP
    
    typealias WebResponseService = (SearchRecipe?, Error?) -> Void

    
    func getCurrentRiver(currentSearch: String, completion: @escaping (SearchRecipe?) -> Void) {
        parameters["q"] = currentSearch
        guard let url = recipeBaseUrl else { return }
       // let request = RecipeRouter.
       // let url = "\(recipeBaseUrl)?app_id=\(parameters["app_id"])&app_key=\(parameters["app_key"])&to=\(parameters["to"])&q=\(parameters["q"])&r=\(parameters["r"])&callback=\(parameters["callback"])"
        //if let recipeBaseUrl = URL(string: Constant.baseURLPath)
           // let request = CreateReaquest.createRequest(url: recipeBaseUrl, arguments: parameters)
      
       Alamofire.request(url, method: .get, parameters: parameters, headers: headers).responseData { (response) in
                
             if (response.result.isSuccess) {
        
                    if let jsonRecipe = response.result.value {
                        guard let data1 = response.data else {
                            print("no data")
                            return
                        }
                        
                        let string1 = String(data: data1, encoding: String.Encoding.utf8) ?? "Data could not printed"
                        print(string1)
                        guard let currentRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data1) else {
                            print("no decode")
                            //print(currentRecipe.label)
                            print(response)
                            print(data1)
                            print(response.debugDescription)
                            print(response.description)
                            return
                        }
                        //print(currentRecipe.label)
                        print(response)
                        print(response.debugDescription)
                        print(response.description)
                            completion(nil)
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
            }
        
        
    }

}

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        let item1 = response.data
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure(response.error!)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
