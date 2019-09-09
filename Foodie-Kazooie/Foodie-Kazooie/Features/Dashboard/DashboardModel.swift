//
//  DashboardModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/9/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol DashboardModelLogic {
}

protocol DashboardDataStore {
	//var name: String { get set }
}

class DashboardModel: DashboardModelLogic, DashboardDataStore {
	var service: DashboardService?
	weak var presenter: DashboardPresentationModelLogic?
    var restaurants: [Restaurants]?

    func loadRestaurants() {
        restaurants = RestaurantHelper().getRestaurants()
        self.presenter?.updateView()
    }
}
