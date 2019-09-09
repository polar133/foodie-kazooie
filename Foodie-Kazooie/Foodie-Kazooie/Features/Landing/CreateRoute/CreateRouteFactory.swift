//
//  CreateRouteFactory.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

@objc public class CreateRouteFactory: NSObject {
    @objc public override init() { }

    @objc public func getCreateRouteViewController() -> CreateRouteViewController {
        let viewController = CreateRouteViewController()
        let presenter = CreateRoutePresenter()
        let service = CreateRouteService()
        let model = CreateRouteModel()
        viewController.presenter = presenter
        viewController.params = presenter
        presenter.view = viewController
        presenter.model = model
        model.service = service
        model.presenter = presenter
        return viewController
    }
}
