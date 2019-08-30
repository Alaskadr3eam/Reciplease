//
//  RecipeSearch.swift
//  Reciplease
//
//  Created by Clément Martin on 20/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
//model for RecipeSearchTableViewController
class RecipeSearch {
    
    private var recipeServiceSession = RecipeService(recipeSession: RecipeSession())
    init(recipeServiceSession: RecipeService) {
        self.recipeServiceSession = recipeServiceSession
    }

    var recipeService = RecipeService(recipeSession: RecipeSession())
    var listRecipe: [RecipePlease] = Array()
    var recipeDetail: RecipePlease!
    var errorRequest: ErrorMessage!
    var ingredientList = String()
    
    var delegateRecipe: ResultRequest?
    
    
    func countIsNul(recipeSearch: SearchRecipe) -> Bool {
        if recipeSearch.count == 0 {
            return true
        }
        return false
    }
    
    
    func addRecipeOfArray(recipeSearch: SearchRecipe) {
        for i in 0..<recipeSearch.hits.count {
            listRecipe.append(recipeSearch.hits[i].recipe)
        }
    }
    
    func searchRecipeTreatment(searchRecipe: SearchRecipe) {
        countIsNul(recipeSearch: searchRecipe) ? delegateRecipe?.resultAlert(error: .errorNoResult) : addRecipeOfArray(recipeSearch: searchRecipe)
    }
    
    func executeRequest(ingredient: String) {
        self.recipeServiceSession .getCurrentRecipe(currentSearch: ingredient) {[weak self]  (error, searchRecipe) in
            guard let self = self else { return }
            if let error = error {
                self.errorRequest = error
                self.delegateRecipe?.resultAlert(error: self.errorRequest)
                return
            }
            guard let recipeSearch = searchRecipe else { return }
            self.searchRecipeTreatment(searchRecipe: recipeSearch)
            self.delegateRecipe?.resultOfSearch()
        }
    }
}

protocol ResultRequest {
    func resultOfSearch()
    func resultAlert(error: ErrorMessage)
}

