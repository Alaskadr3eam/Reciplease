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
    
    case networkError,unknowError,errorNoSource,errorIngredientneeded,errorRecipeLoaded,errorNoDelete,errorAlwayFavorite,errorIdNoValid,errorDeleteFavorite, errorAddFavorite
    
    /*  var preferedStyle: UIAlertController.Type {
     
     }*/
    
    var title: String {
        switch self {
        case .networkError, .unknowError, .errorNoSource:
            return "Alert Network"
        // Search recipe Error messages
        case .errorIngredientneeded,.errorNoDelete,.errorRecipeLoaded:
            return "Alert Ingredient"
        //  Detail favorite Error messages
        case .errorAlwayFavorite,.errorIdNoValid,.errorDeleteFavorite,.errorAddFavorite:
            return "Alert Favoris"
        }
    }
    
    // global  Error messages
    var message: String {
        switch self {
        case .networkError:
            return "NetWork error"
        case .unknowError:
            return "Unknow error"
        case .errorNoSource:
            return "No source"
        // Search recipe Error messages
        case .errorIngredientneeded:
            return "need some ingredients"
        case .errorRecipeLoaded:
            return "Error no recipe loaded"
        case .errorNoDelete:
            return "No delete possible"
        //  Detail favorite Error messages
        case .errorAlwayFavorite:
            return "Always favorite"
        case .errorIdNoValid:
            return "Error Delete no valid Id"
        case .errorDeleteFavorite:
            return "Error Delete failded"
        case .errorAddFavorite:
            return "Error Add failded"
            
        }
    }
    
}
