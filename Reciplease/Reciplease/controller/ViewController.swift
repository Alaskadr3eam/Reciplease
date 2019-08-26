//
//  ViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 18/07/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var recipe = Recipe(recipeServiceSession: RecipeService(recipeSession: RecipeSession()))
    
    @IBOutlet weak var recipleaseView: RecipleaseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipleaseView.delegateRecipleaseView = self
        recipe.delegateRecipe = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recipe.listRecipe = [RecipePlease]()
        recipe.ingredientList = [String]()
        recipleaseView.ingredientTableList.reloadData()
    }
    
    func initSwipeGesture(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeForEditing(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.segueResult {
            if let vcDestination = segue.destination as? ResultSearchTableViewController {
                vcDestination.recipeSearch.listRecipe = recipe.listRecipe
            }
        }
    }
}
