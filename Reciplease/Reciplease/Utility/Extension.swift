//
//  extensionString.swift
//  Reciplease
//
//  Created by Fiona on 07/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire

extension String {
    
    func split(regex pattern: String) -> [String] {
        
        guard let re = try? NSRegularExpression(pattern: pattern, options: [])
            else { return [] }
        
        let nsString = self as NSString // needed for range compatibility
        let stop = "<SomeStringThatYouDoNotExpectToOccurInSelf>"
        let modifiedString = re.stringByReplacingMatches(
            in: self,
            options: [],
            range: NSRange(location: 0, length: nsString.length),
            withTemplate: stop)
        return modifiedString.components(separatedBy: stop)
    }

    func createString() -> String {
        let array = [String]()
        //let array = self
        var string = String()
        for i in 0..<array.count {
            var string = String()
            string += "\(array[i]),"
        }
        return string
    }
}

extension Array {
    func createString() -> String {
        let array = self
        var string = String()
        for i in 0..<array.count {
            string += "\(array[i]),"
        }
        return string
    }
}

    extension UIViewController {
        // use case example : self.presentAlert(message: .errorIngredientneeded)
        func presentAlert(message: errorMessage) {
            let alertVC = UIAlertController(title: "Alerte", message: message.rawValue, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertVC, animated: true, completion: nil)
        }
        
        
    }
    
    // use case example : recipeDetailImageView.downloaded(from: urlImage)
    extension UIImageView {
        func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
            contentMode = mode
            Alamofire.request(url).responseData { response in
                switch response.result {
                case .success:
                    if let data = response.result.value {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async() {
                            self.image = image
                        }
                    }
                case .failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
        
        func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
            guard let url = URL(string: link) else { return }
            downloaded(from: url, contentMode: mode)
        }

        func cornerRadius(cornerRadius: CGFloat) {
            self.layer.cornerRadius = cornerRadius
        }
        
    }

extension Int {
    func hour() -> String {
        let numberMin = self % 60
        let numberHour = self / 60
        if numberHour == 0 && numberMin == 0 {
            let string = "Na"
            return string
        }
        let timeString = String(format: "%01i:%02i", numberHour, numberMin)
        return timeString
    }
}
extension UIView {
    func transformateViewOnImage() -> UIImage{
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
    let imgOriginal = renderer.image { ctx in
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
    }
    return imgOriginal
}
}
