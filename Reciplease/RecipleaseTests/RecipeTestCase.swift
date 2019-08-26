//
//  RecipeTestCase.swift
//  RecipleaseTests
//
//  Created by Clément Martin on 23/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import XCTest
import Alamofire
@testable import Reciplease

class RecipeTestCase: XCTestCase {

    var recipe: Recipe!

    override func setUp() {
        super.setUp()
        recipe = Recipe(recipeServiceSession: RecipeService(recipeSession: RecipeSession()))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    let ingredient = "bannane,chicken,lemon,paprika"
    
    let ingredientList = ["bannane","chicken","lemon","paprika"]
    
    func createReciplease(label: String,image: String, url: String, yield:Int,ingredientLines: [String],totalTime: Int) -> RecipePlease {
        let recipe = RecipePlease(label: label, image: image, url: url, yield: yield, ingredientLines: ingredientLines, totalTime: totalTime)
        return recipe
    }
    func createHit() -> [Hit] {
        var hit = [Hit]()
        let hit1 = Hit(recipe: createReciplease(label: "chicken Visuo", image: "aaaa", url: "bbb", yield: 10, ingredientLines: ["chicken"], totalTime: 50))
        hit.append(hit1)
        let hit2 = Hit(recipe: createReciplease(label: "chicken Lemon", image: "aaaa", url: "bbb", yield: 10, ingredientLines: ["chicken"], totalTime: 50))
        hit.append(hit2)
        let hit3 = Hit(recipe: createReciplease(label: "chicken Paprika", image: "aaaa", url: "bbb", yield: 10, ingredientLines: ["chicken"], totalTime: 50))
        hit.append(hit3)
        return hit
    }
    func createSearchRecipe() -> SearchRecipe {
        let searchRecipe = SearchRecipe(hits: createHit())
        return searchRecipe
    }

    func testIngredientListIsEmpty() {
        
    let result = recipe.ingredientListIsEmpty
        
        XCTAssertEqual(result, true)
        XCTAssertNotEqual(result, false)
    }
    
    func testIngredientListIsNotEmpty() {
        recipe.ingredientList = ["chicken"]
        
        let result = recipe.ingredientListIsEmpty
        
        XCTAssertEqual(result, false)
        XCTAssertNotEqual(result, true)
    }

    func testAddRecipeOfArray() {
        
        recipe.addRecipeOfArray(recipeSearch: createSearchRecipe())
        
        XCTAssertNotEqual(recipe.listRecipe.count, 0)
        XCTAssertNotEqual(recipe.listRecipe.count, 1)
        XCTAssertEqual(recipe.listRecipe.count, 3)
        XCTAssertEqual(recipe.listRecipe[0].label, "chicken Visuo")
    }

    func testReorderIngredientInArray() {
        
        recipe.reorderIngredientInArray(ingredient: ingredient)
        
        XCTAssertEqual(recipe.ingredientList.count, 4)
        XCTAssertEqual(recipe.ingredientList[0], "bannane")
        XCTAssertEqual(recipe.ingredientList[3], "paprika")
        
    }
    
    func testCreateIngredientListForRequestNotIngredient() {
        
       let ingredientRequest = recipe.createListIngredientForRequest()
        
        XCTAssertEqual(ingredientRequest, nil)
    }
    
    func testCreateIngredientListForReques() {
        recipe.ingredientList = ingredientList
        
        let ingredientRequest = recipe.createListIngredientForRequest()
        
        XCTAssertNotEqual(ingredientRequest, nil)
        XCTAssertNotEqual(ingredientRequest!, "bannane,chicken,lemon,paprika")
        XCTAssertNotNil(ingredientRequest)
    }
    
    //MARK: -Function request
    func testRequestNil() {
        let fakeResponse = FakeResponse(response: nil, data: nil, error: TestError.error)
        let recipe1 = Recipe(recipeServiceSession: RecipeService(recipeSession: RecipeSessionFake(fakeResponse: fakeResponse)))
        let ingredient = "chicken"
        
        recipe1.executeRequest(ingredient: ingredient)
        
        XCTAssertEqual(recipe1.listRecipe.count, 0)
        XCTAssertEqual(recipe1.errorRequest, errorMessage.networkError)
    }
    
    func testRequest() {
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.recipeCorrectData, error: nil)
        let recipe1 = Recipe(recipeServiceSession: RecipeService(recipeSession: RecipeSessionFake(fakeResponse: fakeResponse)))
        let ingredient = "chicken"
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        recipe1.executeRequest(ingredient: ingredient)
        
        XCTAssertEqual(recipe1.listRecipe.count, 2)
        XCTAssertEqual(recipe1.listRecipe[0].label, "Chicken Vesuvio")
        XCTAssertEqual(recipe1.listRecipe[1].label, "Chicken Paprikash")
        XCTAssertNil(recipe1.errorRequest)
        expectation.fulfill()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
