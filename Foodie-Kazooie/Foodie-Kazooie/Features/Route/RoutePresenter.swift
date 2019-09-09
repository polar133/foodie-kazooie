//
//  RoutePresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol RouteParametersLogic {
    func setRestaurants(rests: Restaurants)
}

protocol RoutePresentationLogic: class {
    func getName() -> String
    func loadRestaurants()
    func getAmountOfRows() -> Int
    func selectRowAt(index: Int)
    func getRowFor(index: Int) -> (String, String)?
    func saveRoute()
}

protocol RoutePresentationModelLogic: class {
}

class RoutePresenter: RoutePresentationLogic, RoutePresentationModelLogic, RouteParametersLogic {

	weak var view: RouteDisplayLogic?
	var model: (RouteModelLogic & RouteDataStore)?

    func setRestaurants(rests: Restaurants) {
        self.model?.restaurants = rests
    }

    func getName() -> String {
        return self.model?.restaurants?.name ?? ""
    }

    func getAmountOfRows() -> Int {
        guard let restaurants = self.model?.restaurants else {
            return 0
        }
        return restaurants.restaurants.count
    }

    func loadRestaurants() {
        guard let restaurants = self.model?.restaurants else {
            return
        }
        var locations: [LocationViewModel] = []
        for restaurant in restaurants.restaurants {
            locations.append(LocationViewModel(name: restaurant.detail.name,
                                               lat: Double(restaurant.detail.location.latitude) ?? 0.0,
                                               lon: Double(restaurant.detail.location.longitude) ?? 0.0))
        }
        self.view?.setPins(locations: locations)
    }

    func selectRowAt(index: Int) {
        guard let restaurants = self.model?.restaurants else {
            return
        }
        let restaurant = restaurants.restaurants[index].detail
        let vc = RestaurantFactory().getRestaurantViewController()
        vc.params?.setRestaurant(rest: restaurant)
        self.view?.goToRestaurant(viewController: vc)
    }

    func getRowFor(index: Int) -> (String, String)? {
        guard let restaurants = self.model?.restaurants else {
            return nil
        }
        return (restaurants.restaurants[index].detail.name, restaurants.restaurants[index].detail.thumb)
    }

    func saveRoute() {
        self.model?.saveRestaurants()
        self.goToDashboard()
    }

    func goToDashboard() {
        let vc = DashboardFactory().getDashboardViewController()
        self.view?.goToDashboard(viewController: vc)
    }
}
