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
        
        recipeService.executeRequest(currentSearch: ingredient) { (bool, searchRecipe) in
            guard let currentRecipe = searchRecipe else { return }
        }
    
    }
}

