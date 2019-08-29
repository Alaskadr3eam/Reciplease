//
//  recipeData.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import CoreData

struct SearchRecipe: Decodable {
    let hits: [Hit]
    let count: Int
}

struct Hit: Decodable {
    let recipe: RecipePlease
}

struct RecipePlease: Decodable {
    var label: String
    var image: String
    var url: String
    var yield: Int
    var ingredientLines: [String]
    var totalTime: Int
}


