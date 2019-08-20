//
//  DetailView.swift
//  Reciplease
//
//  Created by Clément Martin on 15/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import UIKit

final class DetailView: UIView {
    @IBOutlet weak var labelLike: UILabel!
    @IBOutlet weak var imageLike: UIImageView!
    @IBOutlet weak var labelTimeRecipe: UILabel!
    @IBOutlet weak var imageTime: UIImageView!
    
    var cornerRadiusValue: CGFloat = 20

    func instantiate(labelLikeText: String, labelTimeRecipeText: String) {
        labelLike.text = labelLikeText
        labelTimeRecipe.text = labelTimeRecipeText
        imageLike.image = UIImage(named: "like" )
        imageLike.cornerRadius(cornerRadius: cornerRadiusValue)
        imageTime.image = UIImage(named: "time")
        imageTime.cornerRadius(cornerRadius: cornerRadiusValue)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = cornerRadiusValue
    }


}


