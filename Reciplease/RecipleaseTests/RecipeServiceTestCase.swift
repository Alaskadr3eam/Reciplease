//
//  RecipeServiceTestCase.swift
//  RecipleaseTests
//
//  Created by Clément Martin on 22/08/2019.
//  Copyright © 2019 Clément Martin. All rights reserved.
//

import XCTest
@testable import Reciplease

class RecipeServiceTestCase: XCTestCase {

    
    func testGetRecipeShouldPostFailedCallbackIfError() {
        // Given
       
        let fakeResponse = FakeResponse(response: nil, data: nil, error: TestError.error)
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSession)
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        recipeService.getCurrentRecipe(currentSearch: "chicken") { (error, searchRecipe) in
            
            // Then
            XCTAssertEqual(error, errorMessage.networkError)
            XCTAssertNil(searchRecipe)
            expectation.fulfill()
        }
        //wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostFailedCallbackIfNoData() {
        // Given
        let fakeResponse = FakeResponse(response: nil, data: nil, error: nil)
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSession)
        
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        recipeService.getCurrentRecipe(currentSearch: "chicken") { (error, searchRecipe) in
            
            // Then
            XCTAssertEqual(error, errorMessage.networkError)
            XCTAssertNil(searchRecipe)
            expectation.fulfill()
        }
        
        //wait(for: [expectation], timeout: 0.01)
    }

    func testGetRecipeShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.recipeCorrectData, error: nil)
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSession)
        
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        recipeService.getCurrentRecipe(currentSearch: "chicken") { (error, searchRecipe) in
            // Then
            XCTAssertEqual(error,errorMessage.networkError)
            XCTAssertNil(searchRecipe)
            expectation.fulfill()
        }
        
        //wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.recipeIncorrectData, error: nil)
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSession)
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        recipeService.getCurrentRecipe(currentSearch: "chicken") { (error, searchRecipe) in
            // Then
            XCTAssertEqual(error, errorMessage.errorNoSource)
            XCTAssertNil(searchRecipe)
            expectation.fulfill()
        }
        
        //wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRecipeShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.recipeCorrectData, error: nil)
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipeService(recipeSession: recipeSession)
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        recipeService.getCurrentRecipe(currentSearch: "chicken") { (error, searchRecipe) in
            
            //XCTAssertEqual(FakeResponseData.weatherCorrectData, weatherData)
            XCTAssertNil(error)
            XCTAssertEqual(searchRecipe?.hits[0].recipe.label, "Chicken Vesuvio")
            XCTAssertEqual(searchRecipe?.hits[1].recipe.label, "Chicken Paprikash")
            XCTAssertEqual(searchRecipe?.hits.count, 2)
            expectation.fulfill()
        }
        //wait(for: [expectation], timeout: 0.01)
    }
    


}
