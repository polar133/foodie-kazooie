//
//  CreateRoutePresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

public protocol CreateRouteParametersLogic {
	//Here goes the func that receive data as params if needed to be saved in DataStore.
}

protocol CreateRoutePresentationLogic {
    func getMaxAmoutRestaurants() -> Int
    func createNewRoute(name: String, amountOfRestaurants: Int)
}

protocol CreateRoutePresentationModelLogic: class {
}

class CreateRoutePresenter: CreateRoutePresentationLogic, CreateRoutePresentationModelLogic, CreateRouteParametersLogic {

	weak var view: CreateRouteDisplayLogic?
	var model: CreateRouteModel?

    func getMaxAmoutRestaurants() -> Int {
        return model?.route.maxRestaurants ?? 0
    }

    func createNewRoute(name: String, amountOfRestaurants: Int) {
        if !name.isEmpty && amountOfRestaurants > 0 {
            model?.route.name = name
            model?.route.amount = amountOfRestaurants
            self.presentLocationView()
        } else {
            //TODO: show alert
        }
    }

    func presentLocationView() {
        let vc = LocationFactory().getLocationViewController()
        guard let model = model?.route else {
            return
        }
        vc.params?.setRoute(route: model)
        self.view?.goToLocation(viewController: vc)
    }
}
