//
//  ResultSearchTableViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 15/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

class ResultSearchTableViewController: UITableViewController {
    
    //recipeSearchvar listRecipe: [RecipePlease]!

  //  var recipeService = RecipeService()

    var recipeSearch = RecipeSearch()
    var recipeDetail: RecipePlease!

    
    @IBOutlet weak var tableViewList: UITableView!

    //var listRecipe = [RecipePlease]()

    override func viewDidLoad() {
        super.viewDidLoad()

    //    recipe.delegateRecipeImage = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
   

    
  /* override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCustom", for: indexPath) as! CellCustom
        addImageRecipe(index: indexPath.row)
    if cell.imageRecipe.image?.imageAsset == nil {
        addImageRecipe(index: indexPath.row)
    }
    tableViewList.indexPath(for: cell)
    tableViewList.reloadData()
        ///cell.imageRecipe.image = UIImage(data: recipe.image)
       // tableViewList.reloadData()
    }*/
    
   /* func tableView(_ tableView: UITableView, willDisplay cell: CellCustom, forRowAt indexPath: IndexPath) {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cellCustom", for: indexPath) as! CellCustom
        if cell.isImage == false {
        addImageRecipe(index: indexPath.row)
        }
        cell.isImage = true
    }*/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeDetail = recipeSearch.listRecipe[indexPath.row]
        performSegue(withIdentifier: Constant.segueDetailRecipe, sender: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.segueDetailRecipe {
            if let vcDestination = segue.destination as? DetailRecipeViewController {
                vcDestination.recipeDetail.recipeDetail = recipeDetail
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
/*
extension ResultSearchTableViewController: ResultImage {
    func resultOfImageRecipe(data: Data) {
      
        tableViewList.reloadData()
    }
    
    
}

protocol DisplayRecipe {
    func displayRecipe(index: IndexPath)
}
*/
