//
//  SelectionModelTests.swift
//  Foodie-KazooieTests
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import XCTest
@testable import Foodie_Kazooie

class SelectionModelTests: XCTestCase {

    override func setUp() {
        FoodieStubs().enableStubs()
    }

    func testGetCategories() {
        //Given
        let model = SelectionModel()
        let service = SelectionServiceSpy()
        model.service = service

        //When
        model.getCategories()

        //Then
        XCTAssertTrue(service.getCategoriesCalled)
    }

    func testGetCuisines() {
        //Given
        let model = SelectionModel()
        let service = SelectionServiceSpy()
        model.service = service

        //When
        model.getCuisines()

        //Then
        XCTAssertTrue(service.getCuisinesCalled)
    }

    func testSetSelectedCategories() {
        let model = SelectionModel()
        let ids = [1, 3, 4, 5, 6]
        model.route = Route()
        model.categories = Categories(categories: [Category(categoryDetail: CategoryDetail(id: 1, name: "", imageURL: nil))])
        //When
        model.setSelectedCategories(ids: ids)

        //Then
        XCTAssertEqual(model.route?.categories?.first?.categoryDetail.id, 1)
    }

    func testSetSelectedCuisines() {
        //Given
        let model = SelectionModel()
        let ids = [1, 3, 4, 5, 6]
        model.route = Route()
        model.cuisines = Cuisines(cuisines: [Cuisine(cuisine: CuisineDetail(id: 3, name: "", imageURL: nil))])
        //When
        model.setSelectedCuisines(ids: ids)

        //Then
        XCTAssertEqual(model.route?.cusines?.first?.cuisine.id, 3)
    }

    func testGetRestaurants() {
        //Given
        let model = SelectionModel()
        let service = SelectionServiceSpy()
        model.service = service
        model.route = Route()

        //When
        model.getRestaurants()

        //Then
        XCTAssertTrue(service.getRestaurantsCalled)
    }

    func testGetRestaurantsWithoutRoute() {
        //Given
        let model = SelectionModel()
        let service = SelectionServiceSpy()
        model.service = service

        //When
        model.getRestaurants()

        //Then
        XCTAssertFalse(service.getRestaurantsCalled)
    }

}

class SelectionServiceSpy: SelectionServiceLogic {

    var getCategoriesCalled = false
    var getCuisinesCalled = false
    var getImageCalled = false
    var getRestaurantsCalled = false

    func getCategories(completionHandler: @escaping (Categories?) -> Void) {
        getCategoriesCalled = true
    }
    func getCuisines(city: Int, completionHandler: @escaping (Cuisines?) -> Void) {
        getCuisinesCalled = true
    }
    func getImage(id: Int, name: String, completionHandler: @escaping (Int, Images?) -> Void) {
        getImageCalled = true
    }
    func getRestaurants(route: Route, completionHandler: @escaping (Restaurants?) -> Void) {
        getRestaurantsCalled = true
    }
}
