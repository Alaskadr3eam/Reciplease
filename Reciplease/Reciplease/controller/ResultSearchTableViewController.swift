//
//  ResultSearchTableViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 15/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

class ResultSearchTableViewController: UITableViewController {

    var recipeSearch = RecipeSearch()
   // var recipeDetail: RecipePlease!

    @IBOutlet weak var tableViewList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return recipeSearch.listRecipe.count
    }
    
    private func createCell(cell: CellCustom, index: Int) {
        var listRecipe = recipeSearch.listRecipe
        cell.labelNameRecipe.text = "\(listRecipe[index].label)\n\(listRecipe[index].ingredientLines.createString())"
        cell.detailView.instantiate(labelLikeText: String(listRecipe[index].yield), labelTimeRecipeText: listRecipe[index].totalTime.hour())
        cell.imageRecipe.downloaded(from: listRecipe[index].image)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCustom", for: indexPath) as! CellCustom
        createCell(cell: cell, index: indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeSearch.recipeDetail = recipeSearch.listRecipe[indexPath.row]
        performSegue(withIdentifier: Constant.segueDetailRecipe, sender: nil)
    }
 
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.segueDetailRecipe {
            if let vcDestination = segue.destination as? DetailRecipeViewController {
                vcDestination.recipeDetail.recipeDetail = recipeSearch.recipeDetail
            }
        }
    }
}
