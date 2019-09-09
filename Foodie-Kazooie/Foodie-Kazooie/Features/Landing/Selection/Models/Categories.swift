//
//  Categories.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct Categories: Decodable {
    var categories: [Category]

    mutating func setImageFor(images: [Int: String]) {
        categories.mutateEach { category in
            if images.keys.contains(category.categoryDetail.id) {
                category.categoryDetail.setImage(url: images[category.categoryDetail.id])
            }
        }
    }
}

struct Category: Decodable {
    var categoryDetail: CategoryDetail

    private enum CodingKeys: String, CodingKey {
        case categoryDetail = "categories"
    }
}

struct CategoryDetail: Decodable {
    let id: Int
    let name: String
    var imageURL: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageURL = "image_url"
    }

    mutating func setImage(url: String?) {
        self.imageURL = url
    }
}
