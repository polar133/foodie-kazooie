//
//  SelectionService.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//
import Foundation
import Alamofire

protocol SelectionServiceLogic: class {
    func getCategories(completionHandler: @escaping (Categories?) -> Void)
    func getCuisines(city: Int, completionHandler: @escaping (Cuisines?) -> Void)
    func getImage(id: Int, name: String, completionHandler: @escaping (Int, Images?) -> Void)
    func getRestaurants(route: Route, completionHandler: @escaping (Restaurants?) -> Void)
}

class SelectionService: SelectionServiceLogic {

    func getCategories(completionHandler: @escaping (Categories?) -> Void) {
        let headers: HTTPHeaders = HTTPHeaders(APIFoodie.AuthHeader)

        AF.request(APIFoodie.categories, method: .get, headers: headers)
            .responseDecodable(of: Categories.self, queue: .global()) { response in
                if response.value != nil {
                    completionHandler(response.value)
                } else {
                    completionHandler(nil)
                }
        }
    }

    func getCuisines(city: Int, completionHandler: @escaping (Cuisines?) -> Void) {
        let headers: HTTPHeaders = HTTPHeaders(APIFoodie.AuthHeader)
        let parameters: Parameters = ["city_id": city]
        AF.request(APIFoodie.cuisines, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: Cuisines.self, queue: .global()) { response in
                if response.value != nil {
                    completionHandler(response.value)
                } else {
                    completionHandler(nil)
                }
        }
    }

    func getRestaurants(route: Route, completionHandler: @escaping (Restaurants?) -> Void) {
        let headers: HTTPHeaders = HTTPHeaders(APIFoodie.AuthHeader)
        guard let amout = route.amount, let lat = route.city?.lat, let lon = route.city?.lon else {
            completionHandler(nil)
            return
        }

        let parameters: Parameters = [
            "entity_type": "city",
            "count": amout,
            "lat": lat,
            "lon": lon,
            "radius": 5000,
            "cuisines": route.cusines ?? [],
            "category": route.categories ?? [],
            "sort": "rating"
        ]
        AF.request(APIFoodie.search, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: Restaurants.self, queue: .global()) { response in
                if response.value != nil {
                    completionHandler(response.value)
                } else {
                    completionHandler(nil)
                }
        }

    }

    func getImage(id: Int, name: String, completionHandler: @escaping (Int, Images?) -> Void) {
        let parameters: Parameters = [
            "key": "13561008-06deab8a925d38ecd16b0c5b9",
            "q": "\(name)+Food",
            "image_type": "photo"
        ]

        AF.request(APIFoodie.imageURL, method: .get, parameters: parameters)
            .responseDecodable(of: Images.self, queue: .global(qos: .background)) { response in
                if response.value != nil {
                    completionHandler(id, response.value)
                } else {
                    completionHandler(id, nil)
                }
        }
    }
}
