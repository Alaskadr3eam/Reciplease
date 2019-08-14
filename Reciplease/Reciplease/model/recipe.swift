//
//  recipe.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

class Recipe {

    var ingredientList = [String]()

    var ingredientListIsEmpty: Bool {
        return ingredientList.isEmpty == true
    }

    var recipeService = RecipeService()

    func executeRequest(ingredient: String) {
        
        recipeService.getCurrentRiver(currentSearch: ingredient) { [weak self] (currentRecipe) in
            guard let self = self else { return }
            guard let currentRecipe = currentRecipe else { /*no data*/ return }
            print(currentRecipe)
            print(currentRecipe.label)
        }
    }
}

