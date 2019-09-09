//
//  RestaurantModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol RestaurantModelLogic {
}

protocol RestaurantDataStore {
	//var name: String { get set }
}

class RestaurantModel: RestaurantModelLogic, RestaurantDataStore {
	var service: RestaurantService?
	weak var presenter: RestaurantPresentationModelLogic?
	//var name: String = ""
}
