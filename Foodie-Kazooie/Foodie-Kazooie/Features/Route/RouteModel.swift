//
//  RouteModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol RouteModelLogic {
}

protocol RouteDataStore {
	//var name: String { get set }
}

class RouteModel: RouteModelLogic, RouteDataStore {
	var service: RouteService?
	weak var presenter: RoutePresentationModelLogic?
	//var name: String = ""
}
