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

    private var recipeSession: RecipeSession
    
    init(recipeSession: RecipeSession = RecipeSession()) {
        self.recipeSession = recipeSession
    }

    func getCurrentRecipe(currentSearch: String, from: String, completion: @escaping (errorMessage?,SearchRecipe?) -> Void) {
        Constant.ingredient = currentSearch
        Constant.from = from
        let url: URLConvertible!
        url = Router2.searchRecipe
        recipeSession.request(url: url) { data in
            guard data.response?.statusCode == 200 else {
                switch data.response?.statusCode {
                case 301: print("redirection, respectivement permanente et temporaire")
                case 401:print(" utilisateur non authentifié ")
                case 403:print(" accès refusé")
                case 404:print("page non trouvée")
                case 500, 503:print("erreur serveur")
                case 504:print("le serveur n'a pas répondu")
                default:break
                }
                completion(errorMessage.networkError,nil)
                return
            }
            guard let data = data.data else {
                completion(errorMessage.errorNoSource,nil)
                return
            }
            guard let searchRecipe = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                completion(errorMessage.errorParsingJson,nil)
                return
            }
            completion(nil,searchRecipe)
            
        }
    }
}
