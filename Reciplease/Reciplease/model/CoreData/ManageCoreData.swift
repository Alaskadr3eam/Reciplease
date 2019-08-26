//
//  ManageCoreData.swift
//  Reciplease
//
//  Created by Clément Martin on 21/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import CoreData

/*class ManageCoreData {
    
    var delegateManageCoreData: ManageCoreDataDelegate?
    
    func saveRecipe(recipe: RecipePlease, recipeData: RecipleaseCoreData) {
        let recipeSave = recipeData
        recipeSave.image = recipe.image
        recipeSave.ingredientLines = recipe.ingredientLines
        recipeSave.url = recipe.url
        recipeSave.yield = Int16(recipe.yield)
        recipeSave.totalTime = Int16(recipe.totalTime)
        recipeSave.label = recipe.label
        recipeSave.isFavorite = true
    }
    
    func searchRecord(url: String) -> Bool {
        let request: NSFetchRequest<RecipleaseCoreData> = RecipleaseCoreData.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", url)
        guard let resultRequest = try? AppDelegate.viewContext.fetch(request) else { return false }
        if resultRequest.first != nil {
            return true
        } else {
            return false
        }
    }
    
    /*func addRecipe(recipe: RecipePlease) {
     let recipeSave = RecipleaseCoreData(context: AppDelegate.viewContext)
     saveRecipe(recipe: recipe, recipeData: recipeSave)
     try? AppDelegate.viewContext.save()
     }*/
    
    func addRecipe(recipe: RecipePlease) {
        let recipeSave = RecipleaseCoreData(context: AppDelegate.viewContext)
        saveRecipe(recipe: recipe, recipeData: recipeSave)
        do {
            try AppDelegate.viewContext.save()
        } catch {
            delegateManageCoreData?.alertWithCoreData(error: .errorAddFavorite)
        }
    }
    
    func deleteRecipe(recipe: RecipleaseCoreData) {
        AppDelegate.viewContext.delete(recipe)
        do {
            try AppDelegate.viewContext.save()
        } catch {
            delegateManageCoreData?.alertWithCoreData(error: .errorDeleteFavorite)
        }
    }
}
protocol ManageCoreDataDelegate {
    func alertWithCoreData(error: errorMessage)
}
*/
