//
//  RestaurantFactory.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

@objc public class RestaurantFactory: NSObject {
    @objc public override init() { }

    @objc public func getRestaurantViewController() -> RestaurantViewController {
        let viewController = RestaurantViewController()
        let presenter = RestaurantPresenter()
        let service = RestaurantService()
        let model = RestaurantModel()
        viewController.presenter = presenter
        viewController.params = presenter
        presenter.view = viewController
        presenter.model = model
        model.service = service
        model.presenter = presenter
        return viewController
    }
}