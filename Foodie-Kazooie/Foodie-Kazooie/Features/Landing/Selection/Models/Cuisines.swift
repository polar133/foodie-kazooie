//
//  Cuisines.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct Cuisines: Decodable {
    var cuisines: [Cuisine]

    mutating func setImageFor(images: [Int: String]) {

        cuisines.mutateEach { cuisine in
            if images.keys.contains(cuisine.cuisine.id) {
                cuisine.cuisine.setImage(url: images[cuisine.cuisine.id])
            }
        }
    }
}

struct Cuisine: Decodable {
    var cuisine: CuisineDetail
}

struct CuisineDetail: Decodable {
    let id: Int
    let name: String
    var imageURL: String?

    private enum CodingKeys: String, CodingKey {
        case id = "cuisine_id"
        case name = "cuisine_name"
        case imageURL = "image_url"
    }

    mutating func setImage(url: String?) {
        self.imageURL = url
    }
}
