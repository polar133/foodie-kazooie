//
//  LocationServiceTests.swift
//  Foodie-KazooieTests
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import XCTest
@testable import Foodie_Kazooie

class LocationServiceTests: XCTestCase {

    var service: LocationService?

    override func setUp() {
        FoodieStubs().enableStubs()
        service = LocationService()
    }

    override func tearDown() {
        service = nil
    }

    func testGetCity() {
        //Given
        let lat = 0.0
        let lon = 0.0
        let expectation = self.expectation(description: "Get city information")
        var response: Cities?

        //When
        service?.getCity(lat: lat, lon: lon, completionHandler: { cities in
            response = cities
            expectation.fulfill()
        })

        //Then
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.cities.count, 10)
    }

}
