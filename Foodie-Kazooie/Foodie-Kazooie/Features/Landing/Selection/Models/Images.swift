//
//  Images.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

struct Images: Decodable {
    let hits: [Image]
}

struct Image: Decodable {
    let id: Int
    let largeImageURL: String
}
