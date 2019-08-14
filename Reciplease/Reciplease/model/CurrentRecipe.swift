//
//  recipeData.swift
//  Reciplease
//
//  Created by Clément Martin on 22/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

struct SearchRecipe: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: RecipePlease
}

struct RecipePlease: Decodable {
    let label: String
    let image: String
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let totalTime: Int
}
