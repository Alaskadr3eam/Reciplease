//
//  AlertEnum.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

// All texts for alert messages
// use case example : presentAlert(message: .errorIngredientneeded)
enum errorMessage: String {
    
    case networkError,unknowError,errorNoSource,errorIngredientneeded,errorRecipeLoaded,errorNoDelete,errorAlwayFavorite,errorDeleteFavorite,errorAddFavorite,errorNoResult,error200,errorParsingJson
  
    
    var title: String {
        switch self {
        case .networkError, .unknowError, .errorNoSource, .error200,.errorParsingJson:
            return "Alert Network"
        // Search recipe Error messages
        case .errorIngredientneeded,.errorNoDelete,.errorRecipeLoaded:
            return "Alert Ingredient"
        //  Detail favorite Error messages
        case .errorAlwayFavorite,.errorDeleteFavorite,.errorAddFavorite:
            return "Alert Favoris"
        case .errorNoResult:
            return "Alert Result"
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
        case .error200:
            return "StatusCode != 200"
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
        case .errorDeleteFavorite:
            return "Error Delete failded"
        case .errorAddFavorite:
            return "Error Add failded"
        case .errorNoResult:
            return "No result, either the combination of ingredients gives nothing, or an ingredient is poorly written"
        case .errorParsingJson:
            return "No parsing Json"
        }
    }
    
}
