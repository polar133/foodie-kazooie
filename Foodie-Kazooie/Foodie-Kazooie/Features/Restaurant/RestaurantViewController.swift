//
//  RestaurantViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol RestaurantDisplayLogic: class {

}

public class RestaurantViewController: UIViewController, RestaurantDisplayLogic {
	var presenter: RestaurantPresentationLogic?
	public var params: RestaurantParametersLogic?

	// MARK: Object lifecycle
	init() {
		super.init(nibName: String(describing: RestaurantViewController.self),
                   bundle: Bundle(for: RestaurantViewController.classForCoder()))
	}

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: View lifecycle

	override public func viewDidLoad() {
		super.viewDidLoad()
	}
}
