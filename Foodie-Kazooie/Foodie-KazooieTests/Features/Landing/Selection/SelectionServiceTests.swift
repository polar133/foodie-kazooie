//
//  SelectionServiceTests.swift
//  Foodie-KazooieTests
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import XCTest
@testable import Foodie_Kazooie

class SelectionServiceTests: XCTestCase {

    var service: SelectionService?

    override func setUp() {
        FoodieStubs().enableStubs()
        service = SelectionService()
    }

    func testGetCategories() {
        //Given
        let expectation = self.expectation(description: "Get categories")
        var categories: Categories?

        //When
        service?.getCategories(completionHandler: { response in
            categories = response
            expectation.fulfill()
        })

        //Then
        waitForExpectations(timeout: 0.5, handler: nil)
        XCTAssertNotNil(categories)
        XCTAssertEqual(categories?.categories.count, 13)
    }

    func testGetCuisines() {
        //Given
        let expectation = self.expectation(description: "Get cuisines")
        var cuisines: Cuisines?

        //When
        service?.getCuisines(city: 83, completionHandler: { response in
            cuisines = response
            expectation.fulfill()
        })

        //Then
        waitForExpectations(timeout: 0.5, handler: nil)
        XCTAssertNotNil(cuisines)
        XCTAssertFalse(cuisines!.cuisines.isEmpty)
    }

    func testGetRestaurants() {
        //Given
        let expectation = self.expectation(description: "Get restaurants")
        var restaurants: Restaurants?
        var route = Route()
        route.amount = 8
        route.city = Location(id: 10, name: "TEST", lat: 0.0, lon: 0.0)

        //When
        service?.getRestaurants(route: route, completionHandler: { response in
            restaurants = response
            expectation.fulfill()
        })

        //Then
        waitForExpectations(timeout: 0.5, handler: nil)
        XCTAssertNotNil(restaurants)
    }

    func testGetRestaurantsWithoutData() {
        //Given
        let expectation = self.expectation(description: "Get restaurants")
        var restaurants: Restaurants?
        let route = Route()

        //When
        service?.getRestaurants(route: route, completionHandler: { response in
            restaurants = response
            expectation.fulfill()
        })

        //Then
        waitForExpectations(timeout: 0.5, handler: nil)
        XCTAssertNil(restaurants)
    }

}
