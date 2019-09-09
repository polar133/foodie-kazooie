//
//  LocationModelTests.swift
//  Foodie-KazooieTests
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import XCTest
@testable import Foodie_Kazooie

class LocationModelTests: XCTestCase {

    var service = LocationServiceSpy()

    override func setUp() {
        FoodieStubs().enableStubs()
    }

    func testGetCity() {
        //Given
        let model = LocationModel()
        model.service = service
        let lat = 0.0
        let lon = 0.0

        //When
        model.getCity(lat: lat, lon: lon)

        //Then
        XCTAssertTrue(service.getCityCalled)
    }

}

class LocationServiceSpy: LocationServiceLogic {
    var getCityCalled = false

    func getCity(lat: Double, lon: Double, completionHandler: @escaping (Cities?) -> Void) {
        getCityCalled = true
    }
}
