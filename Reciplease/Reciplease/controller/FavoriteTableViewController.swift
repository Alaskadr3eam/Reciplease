//
//  FavoriteTableViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit
import CoreData

class FavoriteTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)

    var recipeArray: [RecipleaseCoreData]!
    var recipeDetailCoreData: RecipleaseCoreData!
    var recipeSearch: [RecipleaseCoreData] = Array()
    var dataSource: [RecipleaseCoreData] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchController()
    }

    override func viewWillAppear(_ animated: Bool) {
        recipeArray = RecipleaseCoreData.all
        tableView.reloadData()
    }
    // MARK: - func Search Controller
    func initSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Recipe"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        recipeSearch = recipeArray.filter({( recipe : RecipleaseCoreData) -> Bool in
            guard let name = recipe.label else {
                return false
            }
            return name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    func initSwipeGesture(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeForEditing(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering() ? (dataSource = recipeSearch) : (dataSource = recipeArray)
        return dataSource.count
    }

    func createCell(cell: CellCustom, index: Int) {
        guard let label = dataSource[index].label else {
            return
        }
        cell.labelNameRecipe.text = "\(label)\n\(dataSource[index].ingredientLines!.createString())"
        let totalTime = Int(dataSource[index].totalTime)
        cell.detailView.instantiate(labelLikeText: String(dataSource[index].yield), labelTimeRecipeText: String(totalTime.hour()))
        cell.imageRecipe.downloaded(from: dataSource[index].image!)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCustom", for: indexPath) as! CellCustom
        createCell(cell: cell, index: indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recipeDetailCoreData = dataSource[indexPath.row]
        performSegue(withIdentifier: Constant.segueDetailRecipeCoreData, sender: nil)
    }

    @objc func swipeForEditing(_ sender: UISwipeGestureRecognizer?) {
        if tableView.isEditing == true {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let objectDelete = recipeArray[indexPath.row]
            AppDelegate.viewContext.delete(objectDelete)
            recipeArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            try? AppDelegate.viewContext.save()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.segueDetailRecipeCoreData {
            if let vcDestination = segue.destination as? DetailRecipeViewController {
                vcDestination.recipeDetail.recipeDetailCoreData = recipeDetailCoreData
            }
        }
    }
    

}

extension FavoriteTableViewController: UITextFieldDelegate {
  /*  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        return true
    }*/
    
}
extension FavoriteTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    
}
