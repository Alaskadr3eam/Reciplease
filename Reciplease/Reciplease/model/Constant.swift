//
//  Constant.swift
//  Reciplease
//
//  Created by Clément Martin on 23/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation

class Constant {
    static let baseURL = "https://api.edamam.com"
    static let appId = "a62be210"
    static let appKey = "13299fb4f196f5776329da41b4dd7adb"
    static var numberResult = "50"
    static var from = String()
    static var ingredient = String()
    //Segue
    static let segueResult = "segueResult"
    static let segueDetailRecipe = "detailRecipe"
    static let segueDetailRecipeCoreData = "detailRecipeCoreData"
    //request IMage
    static var urlImage = String()
    // message tableview empty
    static var messageFavorisTableView = "No favorites yet. Just tap the star to add a favorite recipe. To remove it from the list of favorites, simply make a left swipe on the recipe."
    static var messageSearchTableView = "Oops! No recipes found sorry."
}
