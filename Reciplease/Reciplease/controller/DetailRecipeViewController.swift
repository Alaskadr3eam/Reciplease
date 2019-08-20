//
//  DetailRecipeViewController.swift
//  Reciplease
//
//  Created by Clément Martin on 19/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit
import SafariServices
import CoreData

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet weak var detailViewRecipe: DetailRecipeView!
    
    var recipeDetail = RecipeDetail()
    var recipeArrayCoreData: [RecipleaseCoreData]!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewRecipe.delegateDetailRecipe = self
        recipeArrayCoreData = RecipleaseCoreData.all
        initView2()

        // Do any additional setup after loading the view.
    }

    func initView2() {
        guard let url = recipeDetail.recipeDetailCoreData.url else { return }
        recipeDetail.recipeDetail == nil ? initView(url: url) : initView(url: recipeDetail.recipeDetail.url)
     /*   guard recipeDetail.recipeDetail != nil else {
            initView(url: recipeDetail.recipeDetailCoreData.url!)
            return
        }
        initView(url: recipeDetail.recipeDetail.url)*/
    }
    func initView(url:String) {
        if !searchRecord(url: url) {
            detailViewRecipe.initView(recipe: recipeDetail)
            detailViewRecipe.favoriteButton.setImage(UIImage(named: "stargreen."), for: .normal)
            return
        }
        detailViewRecipe.initView(recipe: recipeDetail)
    }
    
    func saveRecipe(recipe: RecipePlease, recipeData: RecipleaseCoreData) {
        let recipeSave = recipeData
        recipeSave.image = recipe.image
        recipeSave.ingredientLines = recipe.ingredientLines
        recipeSave.url = recipe.url
        recipeSave.yield = Int16(recipe.yield)
        recipeSave.totalTime = Int16(recipe.totalTime)
        recipeSave.label = recipe.label
        recipeSave.isFavorite = true
    }
    
    func addRecipe(recipe: RecipePlease) {
        let recipeSave = RecipleaseCoreData(context: AppDelegate.viewContext)
        saveRecipe(recipe: recipe, recipeData: recipeSave)
        try? AppDelegate.viewContext.save()
    }

    func searchRecord(url: String) -> Bool {
        let request: NSFetchRequest<RecipleaseCoreData> = RecipleaseCoreData.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", url)
        guard let resultRequest = try? AppDelegate.viewContext.fetch(request) as! [RecipleaseCoreData] else { return false }
        if let url = resultRequest.first {
            print("deja en favoris")
            return false
        } else {
        return true
        }
    }
    
    func shareRecipe(url: String) {
        sharePrepare(url: url)
    }

   func sharePrepare(url: String) {
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

    

 

    // go to source recipe
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



    
    

