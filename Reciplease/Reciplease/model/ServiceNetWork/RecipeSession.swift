//
//  RecipeSession.swift
//  Reciplease
//
//  Created by Clément Martin on 22/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire

class RecipeSession: RecipeProtocol {
    func request(url: URLConvertible, completionHandler: @escaping (DataResponse<Data>) -> Void) {
       Alamofire.request(url).responseData { response in
            completionHandler(response)
        }
    }
 }
