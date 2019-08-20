//
//  AlertEnum.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

import Foundation

// All texts for alert messages
// use case example : self.presentAlert(message: .errorIngredientneeded)
enum errorMessage: String {
    // global  Error messages
    case networkError = "NetWork error"
    case unknowError = "Unknow error"
    case errorNoSource = "No source"
    // Search recipe Error messages
    case errorIngredientneeded = "need some ingredients"
    case errorRecipeLoaded = "Error no recipe loaded"
    case errorNoDelete = "No delete possible"
    //  Detail favorite Error messages
    case errorAlwayFavorite = "Always favorite"
    case errorIdNoValid = "Error Delete no valid Id"
    case errorDeleteFavorite = "Error Delete failded"
}
