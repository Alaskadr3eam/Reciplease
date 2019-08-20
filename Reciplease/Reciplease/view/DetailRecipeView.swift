//
//  DetailRecipeView.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

class DetailRecipeView: UIView {
    //@IBOutlet weak var imageRecipe: UIImageView!
    //@IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelIngredient: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var tableViewIngredient: UITableView!
    @IBOutlet weak var buttonGetDirection: UIButton!
    //@IBOutlet weak var detailView: DetailView!
    @IBOutlet weak var imageReferenceTitle: ImageReferenceView!
    @IBOutlet weak var buttonShare: UIButton!
    var delegateDetailRecipe: DelegateView?
    
    @IBAction func getDirention(_ sender: UIButton) {
        switch sender {
        case buttonGetDirection:
        delegateDetailRecipe?.buttonIsClicked()
        case favoriteButton:
            delegateDetailRecipe?.buttonFavoriteIsClicked()
        case buttonShare:
            delegateDetailRecipe?.shareIsClicked()
        default: break
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func initView(recipe: RecipeDetail) {
        if recipe.recipeDetail == nil {
            initDetailRecipeViewCoreData(recipe: recipe)
        } else {
            initDetailRecipeView(recipe: recipe)
        }
    }

    func initDetailRecipeView(recipe: RecipeDetail) {
        favoriteButton.setImage(UIImage(named: "starwhite"), for: .normal)
        imageReferenceTitle.detailView.instantiate(labelLikeText: String(recipe.recipeDetail.yield), labelTimeRecipeText: String(recipe.recipeDetail.totalTime))
        imageReferenceTitle.imageRecipe.downloaded(from: recipe.recipeDetail.image)
        imageReferenceTitle.labelName.textColor = UIColor.white
        labelIngredient.text = "Ingredients List :"
        imageReferenceTitle.labelName.text = recipe.recipeDetail.label
        //imageRecipe.downloaded(from: recipe.image)
    }

    func initDetailRecipeViewCoreData(recipe: RecipeDetail) {
        favoriteButton.setImage(UIImage(named: "starwhite"), for: .normal)
        imageReferenceTitle.detailView.instantiate(labelLikeText: String(recipe.recipeDetailCoreData.yield), labelTimeRecipeText: String(recipe.recipeDetailCoreData.totalTime))
        imageReferenceTitle.imageRecipe.downloaded(from: recipe.recipeDetailCoreData.image!)
        imageReferenceTitle.labelName.textColor = UIColor.white
        labelIngredient.text = "Ingredients List :"
        imageReferenceTitle.labelName.text = recipe.recipeDetailCoreData.label
        favoriteButtonColor(object: recipe)
        //imageRecipe.downloaded(from: recipe.image!)
    }

    func favoriteButtonColor(object: RecipeDetail) {
        if object.recipeDetailCoreData.isFavorite == true {
            favoriteButton.setImage(UIImage(named: "stargreen."), for: .normal)
        }
    }


}
protocol DelegateView {
    func buttonIsClicked()
    func buttonFavoriteIsClicked()
    func shareIsClicked()
}
