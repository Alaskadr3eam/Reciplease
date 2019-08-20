//
//  recipe.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

class Recipe {

    var delegateRecipe: ResultRequest?

    var ingredientList = [String]()
    
    var image = [Data]()

    var listRecipe = [RecipePlease]()

    var ingredientListIsEmpty: Bool {
        return ingredientList.isEmpty == true
    }

    var recipeService = RecipeService()

    func addRecipeOfArray(recipeSearch: SearchRecipe) {
        for i in 0..<recipeSearch.hits.count {
            listRecipe.append(recipeSearch.hits[i].recipe)
        }
    }

    func reorderIngredientInArray(ingredient: String) {
        let string = ingredient
        let arrayIngredient = string.split(regex: ",")
        print(arrayIngredient.enumerated())
        for ingredient in 0...arrayIngredient.count - 1 {
            ingredientList.append(arrayIngredient[ingredient])
        }
    }
    func createListIngredientForRequest() -> String? {
        if ingredientListIsEmpty {
            print("pas d'ingredient, donc pas de request")
            return nil
        }
        var ingredientRequest = ""
        for ingredient in 0...ingredientList.count - 1 {
            ingredientRequest += ingredientList[ingredient] + ","
        }
        return ingredientRequest
    }
// requestSearch
    func executeRequest(ingredient: String) {
        
        recipeService.getCurrentRecipe(currentSearch: ingredient) { [weak self] (searchRecipe) in
            guard let self = self else { return }
            guard let recipeSearch = searchRecipe else { return }
            self.addRecipeOfArray(recipeSearch: recipeSearch)
            self.delegateRecipe?.resultOfSearch()
            //print(self.listRecipe.enumerated())
        }
    }
    // request image
   /* func executeRequestImage(url: String) {
        recipeService.getCurrentImageData(currentURL: url) { [weak self] (true, data) in
            guard let self = self else { return }
            guard let data = data else { return }
            //self.image = data
            self.image.append(data)
            self.delegateRecipeImage?.resultOfImageRecipe(data: data)
            
        }
    }*/
}

protocol ResultRequest {
    func resultOfSearch()
}

