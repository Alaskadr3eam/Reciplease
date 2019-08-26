//
//  FakeResponseData.swift
//  RecipleaseTests
//
//  Created by Clément Martin on 22/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import Foundation
class FakeResponseData {
    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    // MARK: - Data
    static var recipeCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "recipe", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    static let recipeIncorrectData = "erreur".data(using: .utf8)!
    
}

class TestError: Error {
    static let error = TestError()
}
