//
//  RecipleaseCoreData+CoreDataProperties.swift
//  Reciplease
//
//  Created by Clément Martin on 23/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//
//

import Foundation
import CoreData


extension RecipleaseCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipleaseCoreData> {
        return NSFetchRequest<RecipleaseCoreData>(entityName: "RecipleaseCoreData")
    }

    @NSManaged public var image: String?
    @NSManaged public var ingredientLines: [String]?
    @NSManaged public var label: String?
    @NSManaged public var totalTime: Int16
    @NSManaged public var url: String?
    @NSManaged public var yield: Int16

}
