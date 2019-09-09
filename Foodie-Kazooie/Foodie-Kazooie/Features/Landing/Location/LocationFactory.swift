//
//  LocationFactory.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

class LocationFactory: NSObject {
    override init() { }

    func getLocationViewController() -> LocationViewController {
        let viewController = LocationViewController()
        let presenter = LocationPresenter()
        let service = LocationService()
        let model = LocationModel()
        viewController.presenter = presenter
        viewController.params = presenter
        presenter.view = viewController
        presenter.model = model
        model.service = service
        model.presenter = presenter
        return viewController
    }
}
