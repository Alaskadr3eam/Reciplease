//
//  ProtocolViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

extension ViewController: WhenButtonIsClicked {
    func buttonClearIsClicked() {
        if recipe.ingredientListIsEmpty {
            print("allerte rien a supprimer")
            return
        }
        recipe.ingredientList = [String]()
        recipleaseView.ingredientTableList.reloadData()
    }
    
    func buttonSearchRecipe() {
        let ingredient = recipe.createListIngredientForRequest()
        guard let ingredientRequest = ingredient else {
            return
        }
        recipe.executeRequest(ingredient: ingredientRequest)
    }
    
    func buttonAddIsClicked(ingredient: String) {
        recipe.reorderIngredientInArray(ingredient: ingredient)
        recipleaseView.ingredientTableList.reloadData()
    }
}

extension ViewController: ResultRequest {
    func resultOfSearch() {
        performSegue(withIdentifier: Constant.segueResult, sender: nil)
        recipleaseView.toggleAcitvity(shown: false)
    }
    
    
}
