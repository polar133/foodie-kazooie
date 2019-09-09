//
//  RoutePresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

public protocol RouteParametersLogic {
	//Here goes the func that receive data as params if needed to be saved in DataStore.
}

protocol RoutePresentationLogic {
}

protocol RoutePresentationModelLogic: class {
}

class RoutePresenter: RoutePresentationLogic, RoutePresentationModelLogic, RouteParametersLogic {
	
	weak var view: RouteDisplayLogic?
	var model: RouteModel?
}
