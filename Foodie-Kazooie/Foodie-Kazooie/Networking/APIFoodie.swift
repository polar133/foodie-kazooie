//
//  APIFoodie.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation
import Alamofire
import OHHTTPStubs

enum APIFoodie {
    static let baseURL = "https://developers.zomato.com/api/"
    static let version = "v2.1"
    static let url = "\(APIFoodie.baseURL)\(APIFoodie.version)"

    static let imageURL = "https://pixabay.com/api/" //Docs: https://pixabay.com/api/docs/

    static let AuthHeader = ["user-key": ""]
    static let cities = "\(APIFoodie.url)/cities"
    static let categories = "\(APIFoodie.url)/categories"
    static let cuisines = "\(APIFoodie.url)/cuisines"
    static let search = "\(APIFoodie.url)/search"
}

//swiftlint:disable all
class FoodieStubs {
    // MARK: Foodie Stubs
    public func enableStubs() {
        let categoriesFile = "GET_categories_200.json"
        stub(condition: pathMatches("/categories")) { _ in
            return fixture(
                filePath: OHPathForFile(categoriesFile, type(of: self))!,
                status: 200,
                headers: [:]
            )
        }

        let cuisinesFile = "GET_cuisines_200.json"
        stub(condition: pathMatches("/cuisines")) { _ in
            return fixture(
                filePath: OHPathForFile(cuisinesFile, type(of: self))!,
                status: 200,
                headers: [:]
            )
        }

        let citiesFile = "GET_cities_200.json"
        stub(condition: pathMatches("/cities")) { _ in
            return fixture(
                filePath: OHPathForFile(citiesFile, type(of: self))!,
                status: 200,
                headers: [:]
            )
        }

        let searchFile = "GET_search_200.json"
        stub(condition: pathMatches("/search")) { _ in
            return fixture(
                filePath: OHPathForFile(searchFile, type(of: self))!,
                status: 200,
                headers: [:]
            )
        }

    }

}
