//
//  AppDelegate.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //FoodieStubs().enableStubs()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        UIFont.overrideInitialize()
        IQKeyboardManager.shared.enable = true
        let savedRestaurants = RestaurantHelper().getRestaurants()
        if savedRestaurants.isEmpty {
            let navController = UINavigationController(rootViewController: CreateRouteFactory().getCreateRouteViewController())
            window?.rootViewController = navController
        } else {
            let navController = UINavigationController(rootViewController: DashboardFactory().getDashboardViewController())
            window?.rootViewController = navController
        }
        return true
    }
}
