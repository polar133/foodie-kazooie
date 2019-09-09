//
//  UIView+Extension.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

extension UIView {

    public func loadViewFromNib() -> UIView {
        let myType = type(of: self)
        let bundle = Bundle(for: myType)
        let nib = UINib(nibName: String(describing: myType), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView ?? UIView()
    }
}
