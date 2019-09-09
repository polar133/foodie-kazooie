//
//  LocationPresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol LocationParametersLogic {
    func setRoute(route: Route)
}

protocol LocationPresentationLogic: class {
    func locationSelected(lat: Double, lon: Double)
}

protocol LocationPresentationModelLogic: class {
    func presentSelection()
}

class LocationPresenter: LocationPresentationLogic, LocationPresentationModelLogic, LocationParametersLogic {

	weak var view: LocationDisplayLogic?
	var model: (LocationModelLogic & LocationDataStore)?

    func setRoute(route: Route) {
        self.model?.route = route
    }

    func locationSelected(lat: Double, lon: Double) {
        view?.showLoading()
        self.model?.getCity(lat: lat, lon: lon)
    }

    func presentSelection() {
        view?.hideLoading()
        let vc = SelectionFactory().getSelectionViewController()
        guard let model = model?.route else {
            return
        }
        vc.params?.setRoute(route: model)
        self.view?.goToSelection(viewController: vc)
    }

}
