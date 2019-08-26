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
    var manageCoreData2 = ManageCoreData2()
   // var manageCoreData = ManageCoreData()
    var recipeDetail = RecipeDetail()
    //var recipeArrayCoreData: [RecipleaseCoreData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //manageCoreData2.delegateManageCoreData = self
        detailViewRecipe.delegateDetailRecipe = self
        recipeDetail.recipeArrayCoreData = manageCoreData2.all
        initViewFinal()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initViewFinal()
    }
    // - MARK: init view
    private func initViewFinal() {
        guard recipeDetail.recipeDetail != nil else {
            initView(url: recipeDetail.recipeDetailCoreData.url!)
            return
        }
        initView(url: recipeDetail.recipeDetail.url)
    }
    private func favoris() {
        detailViewRecipe.initView(recipe: recipeDetail)
        detailViewRecipe.favoriteButton.setImage(UIImage(named: "stargreen."), for: .normal)
    }
    private func initView(url:String) {
        manageCoreData2.searchRecord(url: url) ? favoris() : detailViewRecipe.initView(recipe: recipeDetail)
    }
    
    /*func shareRecipe(url: String) {
     sharePrepare(url: url)
     }*/
    
    /*func sharePrepare(url: String) {
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
     }*/
    
    
    
    
    
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



    
    

