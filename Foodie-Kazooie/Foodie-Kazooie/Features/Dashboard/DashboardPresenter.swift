//
//  DashboardPresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/9/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

public protocol DashboardParametersLogic {
	//Here goes the func that receive data as params if needed to be saved in DataStore.
}

protocol DashboardPresentationLogic {
    func loadRestaurants()
    func getAmountOfRows() -> Int
    func selectRowAt(index: Int)
    func getRowFor(index: Int) -> (String, String)?
    func presentNewRoute()
}

protocol DashboardPresentationModelLogic: class {
    func updateView()
}

class DashboardPresenter: DashboardPresentationLogic, DashboardPresentationModelLogic, DashboardParametersLogic {
	weak var view: DashboardDisplayLogic?
	var model: DashboardModel?

    func loadRestaurants() {
        self.model?.loadRestaurants()
    }

    func updateView() {
        self.view?.reloadTableView()
    }

    func getAmountOfRows() -> Int {
        return self.model?.restaurants?.count ?? 0
    }

    func selectRowAt(index: Int) {
        guard let restaurants = self.model?.restaurants else {
            return
        }
        let vc = RouteFactory().getRouteViewController()
        vc.saveAvailable = false
        vc.params?.setRestaurants(rests: restaurants[index])
        self.view?.navigateToNewRoute(vc: vc)
    }

    func presentNewRoute() {
        let vc = CreateRouteFactory().getCreateRouteViewController()
        self.view?.navigateToNewRoute(vc: vc)
    }

    func getRowFor(index: Int) -> (String, String)? {
        guard let restaurants = self.model?.restaurants else {
            return ("", "")
        }
        return (restaurants[index].name ?? "", "\(restaurants[index].restaurants.count)")
    }
}
