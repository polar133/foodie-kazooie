//
//  SelectionModel.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

protocol SelectionModelLogic {
    func setSelectedCategories(ids: [Int])
    func setSelectedCuisines(ids: [Int])
    func getRestaurants()
}

protocol SelectionDataStore {
	var route: Route? { get set }
}

class SelectionModel: SelectionModelLogic, SelectionDataStore {
	var service: SelectionServiceLogic?
	weak var presenter: SelectionPresentationModelLogic?
    var route: Route?
    var categories: Categories?
    var cuisines: Cuisines?

    private func updateImagesForCategories() {
        var imagesCategories: [Int: String] = [:]
        self.categories?.categories.mutateEach { [weak self] category in
            self?.service?.getImage(id: category.categoryDetail.id, name: category.categoryDetail.name, completionHandler: { [weak self] id, response in
                guard let images = response, !images.hits.isEmpty else {
                    return
                }
                imagesCategories[id] = images.hits[0].largeImageURL
                self?.categories?.setImageFor(images: imagesCategories)
            })
        }
    }

    private func updateImagesForCuisines() {
        var imagesCuisines: [Int: String] = [:]
        self.cuisines?.cuisines.mutateEach { [weak self] cuisine in
            self?.service?.getImage(id: cuisine.cuisine.id, name: cuisine.cuisine.name, completionHandler: { [weak self] id, response in
                guard let images = response, !images.hits.isEmpty else {
                    return
                }
                imagesCuisines[id] = images.hits[0].largeImageURL
                self?.cuisines?.setImageFor(images: imagesCuisines)
            })
        }
    }

    func getCategories() {
        service?.getCategories(completionHandler: { [weak self] categories in
            self?.categories = categories
            self?.updateImagesForCategories()
            self?.presenter?.presentCategories()
        })
    }

    func getCuisines() {
        service?.getCuisines(city: self.route?.city?.id ?? 0, completionHandler: { [weak self] cuisines in
            self?.cuisines = cuisines
            self?.updateImagesForCuisines()
            self?.presenter?.presentCuisines()
        })
    }

    func setSelectedCategories(ids: [Int]) {
        let cats = categories?.categories.filter { ids.contains($0.categoryDetail.id) }
        route?.categories = cats
    }

    func setSelectedCuisines(ids: [Int]) {
        let cats = cuisines?.cuisines.filter { ids.contains($0.cuisine.id) }
        route?.cusines = cats
    }

    func getRestaurants() {
        guard let route = self.route else {
            return
        }
        service?.getRestaurants(route: route, completionHandler: { [weak self] restaurants in
            if var rests = restaurants {
                rests.name = self?.route?.name
                self?.presenter?.presentRoute(restaurants: rests)
            }
        })
    }
}
