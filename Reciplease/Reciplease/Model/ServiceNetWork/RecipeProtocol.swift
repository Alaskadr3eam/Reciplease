//
//  RecipeProtocol.swift
//  Reciplease
//
//  Created by Clément Martin on 22/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
import Alamofire

protocol RecipeProtocol {
    func request(url: URLConvertible, completionHandler: @escaping (DataResponse<Data>) -> Void)
}
