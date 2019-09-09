//
//  SelectionPresenter.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol SelectionParametersLogic {
	func setRoute(route: Route)
}

protocol SelectionPresentationLogic: class {
    func loadCategories()
    func loadCuisines()
    func setSegmentSelected(index: Int)
    func getAmountOfRows() -> Int
    func selectRowAt(index: Int)
    func getRowFor(index: Int) -> SelectionViewModel
    func getImageFor(id: Int) -> String?
    func buildRoute()
}

protocol SelectionPresentationModelLogic: class {
    func presentCategories()
    func presentCuisines()
    func presentRoute()
}

enum Segment {
    case categories, cousines
}

class SelectionPresenter: SelectionPresentationLogic, SelectionPresentationModelLogic, SelectionParametersLogic {

	weak var view: SelectionDisplayLogic?
	var model: SelectionModel?
    var segmentSelected: Segment = .categories
    var categoriesViewModels: [SelectionViewModel] = [] {
        didSet {
            let ids = categoriesViewModels.filter { $0.isSelected }.compactMap { $0.id }
            self.model?.setSelectedCategories(ids: ids)
        }
    }
    var cuisinesViewModels: [SelectionViewModel] = [] {
        didSet {
            let ids = cuisinesViewModels.filter { $0.isSelected }.compactMap { $0.id }
            self.model?.setSelectedCuisines(ids: ids)
        }
    }

    func setRoute(route: Route) {
        self.model?.route = route
    }

    func loadCategories() {
        model?.getCategories()
    }

    func loadCuisines() {
        model?.getCuisines()
    }

    func setSegmentSelected(index: Int) {
        switch index {
        case 0:
            self.segmentSelected = Segment.categories
        case 1:
            self.segmentSelected = Segment.cousines
        default:
            self.segmentSelected = Segment.categories
        }
        self.view?.reloadTableView(index: nil)
    }

    func selectRowAt(index: Int) {
        switch self.segmentSelected {
        case .categories:
            if self.model?.route?.availableToAddMoreCategories() ?? false {
                categoriesViewModels[index].isSelected = !categoriesViewModels[index].isSelected
            } else {
                categoriesViewModels[index].isSelected = false
            }
        case .cousines:
            if self.model?.route?.availableToAddMoreCategories() ?? false {
                cuisinesViewModels[index].isSelected = !cuisinesViewModels[index].isSelected
            } else {
                cuisinesViewModels[index].isSelected = false
            }
        }
        self.view?.reloadTableView(index: index)
    }

    func presentCategories() {
        guard let categories = self.model?.categories else {
            return
        }
        categoriesViewModels = []
        for category in categories.categories {
            categoriesViewModels.append(SelectionViewModel(id: category.categoryDetail.id,
                                                           name: category.categoryDetail.name,
                                                           isSelected: false))
        }
        self.view?.reloadTableView(index: nil)
    }

    func presentCuisines() {
        guard let cuisines = self.model?.cuisines else {
            return
        }
        cuisinesViewModels = []
        for cuisines in cuisines.cuisines {
            cuisinesViewModels.append(SelectionViewModel(id: cuisines.cuisine.id,
                                                         name: cuisines.cuisine.name,
                                                         isSelected: false))
        }

        self.view?.reloadTableView(index: nil)
    }

    func getAmountOfRows() -> Int {
        return self.segmentSelected == Segment.categories ? self.categoriesViewModels.count : self.cuisinesViewModels.count
    }

    func getRowFor(index: Int) -> SelectionViewModel {
        return self.segmentSelected == Segment.categories ? categoriesViewModels[index] : cuisinesViewModels[index]
    }

    func buildRoute() {
        self.model?.getRestaurants()
    }

    func presentRoute() {
        let vc = RouteFactory().getRouteViewController()
        self.view?.goToRoute(viewController: vc)
    }

    func getImageFor(id: Int) -> String? {
        switch self.segmentSelected {
        case .categories:
            return self.model?.categories?.categories.filter{ $0.categoryDetail.id == id }[0].categoryDetail.imageURL
        case .cousines:
            return self.model?.cuisines?.cuisines.filter{ $0.cuisine.id == id }[0].cuisine.imageURL
        }
    }
}
