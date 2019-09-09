//
//  UIFont+Extension.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

//swiftlint:disable all
extension UIFont {

    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return kazooie_normalFont(withSize: size)
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return kazooie_boldFont(withSize: size)
    }

    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return kazooie_italicFont(withSize: size)
    }

    class func overrideInitialize() {
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
    }

    static private func loadFontWith(name: String) {
        let pathForResourceString = Bundle.main.path(forResource: name, ofType: "ttf")
        let fontData = NSData(contentsOfFile: pathForResourceString!)
        let dataProvider = CGDataProvider(data: fontData!)
        let fontRef = CGFont(dataProvider!)
        var errorRef: Unmanaged<CFError>?

        if !CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) {
            NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }

    static private func kazooieFont(name: String, size: CGFloat) -> UIFont {
        if let font = UIFont(name: name, size: size) {
            return font
        } else {
            loadFontWith(name: name)
            return UIFont(name: name, size: size)!
        }
    }
    /// Return the default font type used in the app
    ///
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_normalFont(withSize size: CGFloat) -> UIFont {
        return kazooieFont(name: "Montserrat-Regular", size: size)
    }

    /// Return the default bold font type
    ///
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_boldFont(withSize: CGFloat, weight: CGFloat = UIFont.Weight.bold.rawValue) -> UIFont {
        return UIFont.systemFont(ofSize: withSize, weight: UIFont.Weight(rawValue: weight))
    }

    /// Return the default  bold type
    ///
    /// - Parameters:
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_boldFont(withSize size: CGFloat) -> UIFont {
        return kazooieFont(name: "Montserrat-Bold", size: size)
    }

    /// Return the default semi bold type
    ///
    /// - Parameters:
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_semiBoldFont(withSize size: CGFloat) -> UIFont {
        return kazooieFont(name: "Montserrat-SemiBold", size: size)
    }

    /// Return the default semi bold type
    ///
    /// - Parameters:
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_italicFont(withSize size: CGFloat) -> UIFont {
        return kazooieFont(name: "Montserrat-RegularItalic", size: size)
    }

    /// Return the default light type
    ///
    /// - Parameters:
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_LightFont(withSize size: CGFloat) -> UIFont {
        return kazooieFont(name: "Montserrat-Light", size: size)
    }

    /// Return the default medium type
    ///
    /// - Parameters:
    /// - Parameter withSize: The font size
    /// - Returns: An instance of UIFont
    static func kazooie_mediumFont(withSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: withSize, weight: UIFont.Weight.medium)
    }
}
