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
        
        recipeService.getCurrentRiver(currentSearch: ingredient) { (searchRecipe) in
            guard let recipeSearch = searchRecipe else { return }
        }
    }
}

