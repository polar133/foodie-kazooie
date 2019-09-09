//
//  Cities.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct Cities: Decodable {
    let cities: [City]

    private enum CodingKeys: String, CodingKey {
        case cities = "location_suggestions"
    }
}

struct City: Decodable {
    let id: Int
    let name: String
    let countryID: Int
    let countryName: String
    let stateID: Int
    let stateName: String
    let stateCode: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case countryID = "country_id"
        case countryName = "country_name"
        case stateID = "state_id"
        case stateName = "state_name"
        case stateCode = "state_code"
    }
}
