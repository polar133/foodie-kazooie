//
//  RestaurantPresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

public protocol RestaurantParametersLogic {
	//Here goes the func that receive data as params if needed to be saved in DataStore.
}

protocol RestaurantPresentationLogic {
}

protocol RestaurantPresentationModelLogic: class {
}

class RestaurantPresenter: RestaurantPresentationLogic, RestaurantPresentationModelLogic, RestaurantParametersLogic {
	
	weak var view: RestaurantDisplayLogic?
	var model: RestaurantModel?
}
