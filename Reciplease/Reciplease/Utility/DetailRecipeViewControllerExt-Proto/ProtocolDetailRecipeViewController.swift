//
//  ProtocolDetailRecipeViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import SafariServices

extension DetailRecipeViewController: DelegateView {
    func shareIsClicked() {
        if recipeDetail.recipeDetail != nil {
            shareRecipe(url: recipeDetail.recipeDetail.url)
        } else {
            guard let url = recipeDetail.recipeDetailCoreData.url else { return }
            shareRecipe(url: url)
        }
    }
    
    func buttonFavoriteIsClicked() {
        if recipeDetail.recipeDetail != nil {
            if recipeDetail.isFavorite == true {
                //alerte
                print("deja en favoris")
            } else {
                if searchRecord(url: recipeDetail.recipeDetail.url) {
                addRecipe(recipe: recipeDetail.recipeDetail)
                recipeDetail.isFavorite = true
                detailViewRecipe.favoriteButton.setImage(UIImage(named: "stargreen."), for: .normal)
                } else {
                    print("deja en favoris")
                }
            }
        } else {
       
            //allerte
            print("deja en favoris")
       
        }
    }
    
    private func directionSafari(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    func buttonIsClicked() {
        directionSafari(for: recipeDetail.recipeDetail.url)
    }
}
