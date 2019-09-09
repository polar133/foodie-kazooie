//
//  LocationService.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import Foundation
import Alamofire

protocol LocationServiceLogic: class {
    func getCity(lat: Double, lon: Double, completionHandler: @escaping (Cities?) -> Void)
}

class LocationService: LocationServiceLogic {
    func getCity(lat: Double, lon: Double, completionHandler: @escaping (Cities?) -> Void) {
        let headers: HTTPHeaders = HTTPHeaders(APIFoodie.AuthHeader)
        let parameters: Parameters = ["lat": lat, "lon": lon, "count": 1]

        AF.request(APIFoodie.cities, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: Cities.self, queue: .global()) { response in
                if response.value != nil {
                    completionHandler(response.value)
                } else {
                    completionHandler(nil)
                }
        }
    }
}
