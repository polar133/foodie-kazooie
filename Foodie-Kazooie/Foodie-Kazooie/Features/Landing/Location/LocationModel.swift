//
//  LocationModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol LocationModelLogic {
    func getCity(lat: Double, lon: Double)
}

protocol LocationDataStore {
    var route: Route? { get set }
}

class LocationModel: LocationModelLogic, LocationDataStore {
	var service: LocationServiceLogic?
	weak var presenter: LocationPresentationModelLogic?
	var route: Route?

    func getCity(lat: Double, lon: Double) {
        self.service?.getCity(lat: lat, lon: lon, completionHandler: { [weak self] cities in
            if cities != nil, (cities?.cities.count ?? 0) > 0, let city = cities?.cities.first {
                self?.route?.city = Location(id: city.id, name: city.name, lat: lat, lon: lon)
                self?.presenter?.presentSelection()
            }
        })
    }
}
