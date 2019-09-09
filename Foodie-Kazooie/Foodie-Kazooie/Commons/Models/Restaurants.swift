//
//  Restaurants.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct Restaurants: Codable {
    let restaurants: [Restaurant]
    var name: String?
}

struct Restaurant: Codable {
    let detail: RestaurantDetail

    private enum CodingKeys: String, CodingKey {
        case detail = "restaurant"
    }
}

struct RestaurantDetail: Codable {
    let id: String
    let name: String
    let url: String
    let location: RestaurantLocation
    let userRating: RestaurantRating
    let cuisines: String
    let timings: String
    let averageCostForTwo: Int
    let highlights: [String]
    let thumb: String
    let photosUrl: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
        case location = "location"
        case userRating = "user_rating"
        case cuisines = "cuisines"
        case timings = "timings"
        case averageCostForTwo = "average_cost_for_two"
        case highlights = "highlights"
        case thumb = "thumb"
        case photosUrl = "photos_url"
    }
}

struct RestaurantLocation: Codable {
    let address: String
    let locality: String
    let city: String
    let latitude: String
    let longitude: String
}

struct RestaurantRating: Codable {
    let rating: String
    let votes: String

    private enum CodingKeys: String, CodingKey {
        case rating = "rating_text"
        case votes = "votes"
    }
}
