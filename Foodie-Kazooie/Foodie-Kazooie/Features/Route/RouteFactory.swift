//
//  RouteFactory.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

class RouteFactory: NSObject {
    public override init() { }

    func getRouteViewController() -> RouteViewController {
        let viewController = RouteViewController()
        let presenter = RoutePresenter()
        let service = RouteService()
        let model = RouteModel()
        viewController.presenter = presenter
        viewController.params = presenter
        presenter.view = viewController
        presenter.model = model
        model.service = service
        model.presenter = presenter
        return viewController
    }

}
