//
//  CreateRouteViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import fluid_slider
import Lottie

protocol CreateRouteDisplayLogic: class {
    func goToLocation(viewController: UIViewController)
}

public class CreateRouteViewController: KazooieViewController, CreateRouteDisplayLogic {
	var presenter: CreateRoutePresentationLogic?
	public var params: CreateRouteParametersLogic?

    @IBOutlet private weak var lottieView: AnimationView!
    @IBOutlet private weak var slider: Slider!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var cardContainerView: UIStackView!

    // MARK: Object lifecycle
	init() {
		super.init(nibName: String(describing: CreateRouteViewController.self),
                   bundle: Bundle(for: CreateRouteViewController.classForCoder()))
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
        self.title = "Create a route"

        buildCardView()
        buildSlider()
	}

    public override func viewDidAppear(_ animated: Bool) {
        buildAnimation()
        super.viewDidAppear(animated)
    }

    func buildCardView() {
        cardView.layer.cornerRadius = 4
        cardView.layer.borderColor = UITheme.Colors.disable.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowColor = UITheme.Colors.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 2, height: 2)
        cardView.layer.shadowRadius = 2
    }

    func buildAnimation() {
        let foodAnimation = AnimationView(name: "food")
        lottieView.contentMode = .scaleAspectFill
        self.lottieView.addSubview(foodAnimation)
        foodAnimation.updateConstraints()
        foodAnimation.frame = self.lottieView.bounds
        foodAnimation.loopMode = .loop
        foodAnimation.play()
    }

    func buildSlider() {
        slider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 2
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * CGFloat(self.presenter?.getMaxAmoutRestaurants() ?? 0)) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "\(self.presenter?.getMaxAmoutRestaurants() ?? 0)"))
        slider.fraction = 0.0
        slider.shadowOffset = CGSize(width: 0, height: 3)
        slider.shadowBlur = 5
        slider.shadowColor = UIColor(white: 0, alpha: 0.1)
        slider.contentViewColor = UITheme.Colors.primary
        slider.valueViewColor = UITheme.Colors.white
    }

    @IBAction func continueAction(_ sender: Any) {
        let sliderIndexValueRaw = CGFloat(self.presenter?.getMaxAmoutRestaurants() ?? 0) * (slider.fraction * 100).rounded() / 100
        let sliderValue = Int(sliderIndexValueRaw.rounded())
        self.presenter?.createNewRoute(name: nameField.text ?? "", amountOfRestaurants: sliderValue)
    }

    func goToLocation(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
