//
//  RestaurantViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import SDWebImage

protocol RestaurantDisplayLogic: class {

}

public class RestaurantViewController: KazooieViewController, RestaurantDisplayLogic {
	var presenter: RestaurantPresentationLogic?
    var params: RestaurantParametersLogic?

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var photoImage: UIImageView!
    @IBOutlet private weak var nameTitle: UILabel!
    @IBOutlet private weak var userRatingTitle: UILabel!
    @IBOutlet private weak var userRatingValue: UILabel!
    @IBOutlet private weak var cuisinesTitle: UILabel!
    @IBOutlet private weak var cuisinesValue: UILabel!
    @IBOutlet private weak var timingsTitle: UILabel!
    @IBOutlet private weak var timingsValue: UILabel!
    @IBOutlet private weak var averageCostForTwoTitle: UILabel!
    @IBOutlet private weak var averageCostForTwoValue: UILabel!

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
        self.title = "Restaurant"
        setupView()
	}

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    func setupView() {
        containerView.backgroundColor = UITheme.Colors.background
        containerView.layer.cornerRadius = 9
        nameTitle.font = UIFont.kazooie_boldFont(withSize: 23)

        userRatingTitle.font = UIFont.kazooie_normalFont(withSize: 16)
        cuisinesTitle.font = UIFont.kazooie_normalFont(withSize: 16)
        timingsTitle.font = UIFont.kazooie_normalFont(withSize: 16)
        averageCostForTwoTitle.font = UIFont.kazooie_normalFont(withSize: 16)

        userRatingValue.font = UIFont.kazooie_LightFont(withSize: 16)
        cuisinesValue.font = UIFont.kazooie_LightFont(withSize: 16)
        timingsValue.font = UIFont.kazooie_LightFont(withSize: 16)
        averageCostForTwoValue.font = UIFont.kazooie_LightFont(withSize: 16)

        userRatingTitle.text = "User Rating"
        cuisinesTitle.text = "Cuisines"
        timingsTitle.text = "Time"
        averageCostForTwoTitle.text = "Average Cost"

        let viewModel = presenter?.loadInformation()
        nameTitle.text = viewModel?.name
        userRatingValue.text = viewModel?.rating
        cuisinesValue.text = viewModel?.cuisines
        timingsValue.text = viewModel?.timing
        averageCostForTwoValue.text = viewModel?.averageCost
        guard let photo = viewModel?.photoURL, let url = URL(string: photo) else {
            return
        }
        self.photoImage.sd_setImage(with: url)
    }

}
