//
//  DashboardFactory.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/9/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

@objc public class DashboardFactory: NSObject {
    @objc public override init() { }

    @objc func getDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController()
        let presenter = DashboardPresenter()
        let service = DashboardService()
        let model = DashboardModel()
        viewController.presenter = presenter
        viewController.params = presenter
        presenter.view = viewController
        presenter.model = model
        model.service = service
        model.presenter = presenter
        return viewController
    }
}
