//
//  RecipleaseCoreData+CoreDataProperties.swift
//  
//
//  Created by Clément Martin on 19/08/2019.
//
//

import Foundation
import CoreData


extension RecipleaseCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipleaseCoreData> {
        return NSFetchRequest<RecipleaseCoreData>(entityName: "RecipleaseCoreData")
    }

    @NSManaged public var image: String?
    @NSManaged public var ingredientLines: [String]? /*NSObject?*/
    @NSManaged public var label: String?
    @NSManaged public var url: String?
    @NSManaged public var yield: Int16
    @NSManaged public var totalTime: Int16
    @NSManaged public var isFavorite: Bool
    
    static var all: [RecipleaseCoreData] {
        let request: NSFetchRequest<RecipleaseCoreData> = RecipleaseCoreData.fetchRequest()
        guard let recipes = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return recipes
    }

  
    
    
 /*   func transformInReciplease() -> RecipePlease {
        var recipe = RecipePlease(from: Decoder)
        //let data = self
        recipe.image = self.image!
        recipe.label = self.label!
        recipe.ingredientLines = self.ingredientLines!
        recipe.totalTime = Int(self.totalTime)
        recipe.yield = Int(self.yield)
        recipe.url = self.url!
        return recipe
    }*/

}
