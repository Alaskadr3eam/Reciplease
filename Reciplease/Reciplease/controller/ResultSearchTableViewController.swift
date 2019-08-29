//
//  ResultSearchTableViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 15/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

class ResultSearchTableViewController: UITableViewController {
    
    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    // scrollview
    var lastContentOffset: CGFloat = 0
    var recipeSearch = RecipeSearch(recipeServiceSession: RecipeService(recipeSession: RecipeSession()))

    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeSearch.delegateRecipe = self
        recipeSearch.executeRequest(ingredient: recipeSearch.ingredientList, from: "0")
        tableViewList.setLoadingScreen(loadingView: loadingView, spinner: spinner, loadingLabel: loadingLabel)
    }
    
    @IBAction func clickButton() {
        let number = (recipeSearch.listRecipe.count * 2) - 1
        Constant.numberResult = String(number)
        let from = recipeSearch.listRecipe.count + 1
        recipeSearch.executeRequest(ingredient: recipeSearch.ingredientList, from: String(from))
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
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let middle = recipeSearch.listRecipe.count / 2
        if indexPath.section == tableView.numberOfSections - 1 &&
            indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - middle {
            scroll(tableViewList)
        }
    }
    //ScrollView
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    private func scroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            let number = (recipeSearch.listRecipe.count * 2) - 1
            Constant.numberResult = String(number)
            let from = recipeSearch.listRecipe.count + 1
            recipeSearch.executeRequest(ingredient: recipeSearch.ingredientList, from: String(from))
        }
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
