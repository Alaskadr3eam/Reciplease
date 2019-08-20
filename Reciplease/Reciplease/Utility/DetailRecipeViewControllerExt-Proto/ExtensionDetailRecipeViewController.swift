//
//  ExtensionDetailRecipeViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import UIKit

extension DetailRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipeDetail.recipeDetail == nil {
            return (recipeDetail.recipeDetailCoreData.ingredientLines?.count)!
        } else {
        return recipeDetail.recipeDetail.ingredientLines.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCustomRecipe", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = UIColor.white
        if recipeDetail.recipeDetailCoreData == nil {
        cell.textLabel!.text = "- \(recipeDetail.recipeDetail.ingredientLines[indexPath.row])"
        } else {
            let string = recipeDetail.recipeDetailCoreData.ingredientLines
            cell.textLabel!.text = string![indexPath.row]
        }
        return cell
    }
    
    
}
