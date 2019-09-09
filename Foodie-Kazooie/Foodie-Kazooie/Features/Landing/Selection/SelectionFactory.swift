//
//  SelectionFactory.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

@objc class SelectionFactory: NSObject {
    @objc public override init() { }

    @objc func getSelectionViewController() -> SelectionViewController {
        let viewController = SelectionViewController()
        let presenter = SelectionPresenter()
        let service = SelectionService()
        let model = SelectionModel()
        viewController.presenter = presenter
        viewController.params = presenter
        presenter.view = viewController
        presenter.model = model
        model.service = service
        model.presenter = presenter
        return viewController
    }
}
