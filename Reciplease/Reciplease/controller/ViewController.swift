//
//  ViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 18/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var recipe = Recipe()
    
    @IBOutlet weak var recipleaseView: RecipleaseView!

    override func viewDidLoad() {
        super.viewDidLoad()
      recipleaseView.delegateRecipleaseView = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initSwipeGesture(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeForEditing(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }


}

extension ViewController: WhenButtonIsClicked {
    func buttonClearIsClicked() {
        if recipe.ingredientListIsEmpty {
            print("allerte rien a supprimer")
            return
        }
        recipe.ingredientList = [String]()
        recipleaseView.ingredientTableList.reloadData()
    }
    
    func buttonSearchRecipe() {
        if recipe.ingredientListIsEmpty {
            print("pas d'ingredient, donc pas de request")
            return
        }
        var ingredientRequest = ""
        for ingredient in 0...recipe.ingredientList.count - 1 {
            ingredientRequest += recipe.ingredientList[ingredient] + ","
        }
        recipe.executeRequest(ingredient: ingredientRequest)
    }
    
    func buttonAddIsClicked(ingredient: String) {
        let string1 = ingredient
        let arrayIngredient = string1.split(regex: ", ")
        print(arrayIngredient.enumerated())
        for ingredient in 0...arrayIngredient.count - 1 {
            recipe.ingredientList.append(arrayIngredient[ingredient])
        }
        recipleaseView.ingredientTableList.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  recipe.ingredientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        cell.textLabel?.text = recipe.ingredientList[indexPath.row]
        return cell
    }

    @objc func swipeForEditing(_ sender: UISwipeGestureRecognizer?) {
        if recipleaseView.ingredientTableList.isEditing == true {
            recipleaseView.ingredientTableList.isEditing = false
        } else {
            recipleaseView.ingredientTableList.isEditing = true
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      
        if editingStyle == .delete {
            let ingredientDelete = recipe.ingredientList[indexPath.row]
            recipe.ingredientList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    
    
}

