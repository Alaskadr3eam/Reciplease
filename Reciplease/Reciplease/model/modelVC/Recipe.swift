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
        var listRecipe = [RecipePlease]()
        var errorRequest: errorMessage!
        var ingredientListIsEmpty: Bool {
            return ingredientList.isEmpty == true
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
    }

  



