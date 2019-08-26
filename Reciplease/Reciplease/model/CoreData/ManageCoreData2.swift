//
//  ManageCoreData2.swift
//  Reciplease
//
//  Created by Clément Martin on 23/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ManageCoreData2 {
    
    let persistentContainer: NSPersistentContainer!
    
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
   
    convenience init() {
        //Use the default container for production environment
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else { fatalError("no coreData") }
    
        self.init(container: appDelegate.persistentContainer)
    }
    
    var all: [RecipleaseCoreData] {
        let request: NSFetchRequest<RecipleaseCoreData> = RecipleaseCoreData.fetchRequest()
        guard let recipes = try? self.persistentContainer.viewContext.fetch(request) else { return [] }
        return recipes
    }

    func searchRecord(url: String) -> Bool {
        let request: NSFetchRequest<RecipleaseCoreData> = RecipleaseCoreData.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", url)
        guard let resultRequest = try? self.persistentContainer.viewContext.fetch(request) else { return false }
        if resultRequest.first != nil {
            return true
        } else { return false }
    }

    func addRecipe(recipe: RecipePlease) {
        let recipeSave = RecipleaseCoreData(context: self.persistentContainer.viewContext)
        saveRecipe(recipe: recipe, recipeData: recipeSave)
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            //delegateerror
        }
            //self.saveContext()
    }

    func saveRecipe(recipe: RecipePlease, recipeData: RecipleaseCoreData) {
        let recipeSave = recipeData
        recipeSave.image = recipe.image
        recipeSave.ingredientLines = recipe.ingredientLines
        recipeSave.url = recipe.url
        recipeSave.yield = Int16(recipe.yield)
        recipeSave.totalTime = Int16(recipe.totalTime)
        recipeSave.label = recipe.label
    }
    
    func deleteRecipe(recipe: RecipleaseCoreData) {
        self.persistentContainer.viewContext.delete(recipe)
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            // delegateError
        }
    }


}

protocol ManageCoreDataDelegate2 {
    func alertWithCoreData(error: errorMessage)
}
