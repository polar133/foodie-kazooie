//
//  Route.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct Route {
    var name: String?
    var amount: Int?
    var city: Location?
    var categories: [Category]?
    var cusines: [Cuisine]?
    var restaurants: [String]?
    let maxRestaurants = 20
    let maxCategories = 5

    func amountOfSelections() -> Int {
        guard let categories = self.categories, let cusines = self.cusines else {
            return 0
        }
        return categories.count + cusines.count
    }

    func availableToAddMoreCategories() -> Bool {
        return amountOfSelections() < maxCategories
    }

    init() {}

}

struct Location {
    var id: Int
    var name: String
    var lat: Double
    var lon: Double
}
