//
//  RouteModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol RouteModelLogic {
    func saveRestaurants()
}

protocol RouteDataStore {
	var restaurants: Restaurants? { get set }
}

class RouteModel: RouteModelLogic, RouteDataStore {
	var service: RouteServiceLogic?
	weak var presenter: RoutePresentationModelLogic?
	var restaurants: Restaurants?

    func saveRestaurants() {
        guard let restaurants = self.restaurants else {
            return
        }
        var value = RestaurantHelper().getRestaurants()
        value.append(restaurants)
        RestaurantHelper().saveRestaurants(restaurants: value)
    }
}
