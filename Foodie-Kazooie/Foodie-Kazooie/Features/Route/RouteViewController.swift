//
//  RouteViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol RouteDisplayLogic: class {

}

class RouteViewController: KazooieViewController, RouteDisplayLogic {
	var presenter: RoutePresentationLogic?
	var params: RouteParametersLogic?

	// MARK: Object lifecycle
	init() {
		super.init(nibName: String(describing: RouteViewController.self),
                   bundle: Bundle(for: RouteViewController.classForCoder()))
	}

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
