//
//  RestaurantHelper.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/9/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct RestaurantHelper {

    let defaults = UserDefaults.standard

    func getRestaurants() -> [Restaurants] {
        guard let savedRestaurants = defaults.data(forKey: "restaurants") else {
            return []
        }
        if let data = try? JSONDecoder().decode([Restaurants].self, from: savedRestaurants) {
            return data
        }
        return []
    }

    func saveRestaurants(restaurants: [Restaurants]) {

        if let data = try? JSONEncoder().encode(restaurants) {
            defaults.set(data, forKey: "restaurants")
        }
    }
}
