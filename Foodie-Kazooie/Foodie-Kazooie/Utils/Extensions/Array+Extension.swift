//
//  Array+Extension.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import Foundation

extension Array {
    mutating func mutateEach(_ body: (inout Element)->()) {
        for index in self.indices {
            body( &self[index] )
        }
    }
}
