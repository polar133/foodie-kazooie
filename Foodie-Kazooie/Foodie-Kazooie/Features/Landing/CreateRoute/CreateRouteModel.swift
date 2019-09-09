//
//  CreateRouteModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol CreateRouteModelLogic {
}

protocol CreateRouteDataStore {
}

class CreateRouteModel: CreateRouteModelLogic, CreateRouteDataStore {
	var service: CreateRouteService?
	weak var presenter: CreateRoutePresentationModelLogic?
	var route: Route = Route()

}
