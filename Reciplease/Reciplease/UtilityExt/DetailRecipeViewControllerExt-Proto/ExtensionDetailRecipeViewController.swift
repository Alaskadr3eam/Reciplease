//
//  ExtensionDetailRecipeViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

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

extension DetailRecipeViewController: DelegateView {
    func buttonFavoriteIsClicked() {
        if recipeDetail.recipeDetail == nil {
            presentAlert(error: .errorAlwayFavorite)
        } else {
            manageCoreData.searchRecord(url: recipeDetail.recipeDetail.url) ? presentAlert(error: .errorAlwayFavorite) : noFavoris(recipe: recipeDetail.recipeDetail)
        }
    }
    
    private func noFavoris(recipe: RecipePlease) {
        manageCoreData.addRecipe(recipe: recipe)
        detailViewRecipe.favoriteButton.setImage(UIImage(named: "stargreen."), for: .normal)
    }
    
    func shareIsClicked() {
        if recipeDetail.recipeDetail != nil {
            shareRecipe(url: recipeDetail.recipeDetail.url)
        } else {
            guard let url = recipeDetail.recipeDetailCoreData.url else { return }
            shareRecipe(url: url)
        }
    }
    
    private func shareRecipe(url: String) {
        sharePrepare(url: url)
    }
    
    private func sharePrepare(url: String) {
        let myRecipe = NSURL(string: url)
        let image: UIImage = detailViewRecipe.imageReferenceTitle.imageRecipe.transformateViewOnImage()
        guard let url = myRecipe else {
            print("no found")
            return
        }
        let shareItems: Array = [image,url]
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.addToReadingList]
        self.present(activityViewController, animated: true, completion: nil)
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

extension DetailRecipeViewController: ManageCoreDataDelegate {
    func alertWithCoreData(error: errorMessage) {
        presentAlert(error: error)
    }
}
