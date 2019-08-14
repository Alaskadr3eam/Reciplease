//
//  RecipleaseView.swift
//  Reciplease
//
//  Created by Fiona on 07/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import UIKit

class RecipleaseView: UIView {
    
    var delegateRecipleaseView: WhenButtonIsClicked?

    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var addIngredientButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var ingredientTableList: UITableView!
    @IBOutlet weak var searchButtonRecipe: UIButton!
    
    var ingredientTextFieldIsEmpty: Bool {
        return ingredientTextField.text?.isEmpty == true
    }

    @IBAction func addIngredient(_ sender: UIButton) {
        switch sender {
        case addIngredientButton:
            if ingredientTextFieldIsEmpty {
                print("alerte")
                return
            }
            if let text = ingredientTextField.text {
                delegateRecipleaseView?.buttonAddIsClicked(ingredient: text)
                ingredientTextField.text = ""
            }
        case clearButton:
            delegateRecipleaseView?.buttonClearIsClicked()
            
        case searchButtonRecipe:
            delegateRecipleaseView?.buttonSearchRecipe()
        default: break
        }
        
    }
}

protocol WhenButtonIsClicked {
    func buttonAddIsClicked(ingredient: String)
    func buttonClearIsClicked()
    func buttonSearchRecipe()
}
