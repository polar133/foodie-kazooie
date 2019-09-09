//
//  RestaurantPresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol RestaurantParametersLogic {
    func setRestaurant(rest: RestaurantDetail)
}

protocol RestaurantPresentationLogic {
    func loadInformation() -> RestaurantViewModel?
}

protocol RestaurantPresentationModelLogic: class {
}

class RestaurantPresenter: RestaurantPresentationLogic, RestaurantPresentationModelLogic, RestaurantParametersLogic {

	weak var view: RestaurantDisplayLogic?
	var model: RestaurantModel?

    func setRestaurant(rest: RestaurantDetail) {
        self.model?.restaurant = rest
    }

    func loadInformation() -> RestaurantViewModel? {
        guard let rest = self.model?.restaurant else {
            return nil
        }
        return RestaurantViewModel(name: rest.name,
                                   rating: rest.userRating.rating,
                                   cuisines: rest.cuisines,
                                   timing: rest.timings,
                                   averageCost: "\(rest.averageCostForTwo / 2)", photoURL: rest.thumb)
    }
}
