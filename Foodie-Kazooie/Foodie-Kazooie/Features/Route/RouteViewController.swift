//
//  RouteViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import FloatingPanel
import MapKit

protocol RouteDisplayLogic: class {
    func setPins(locations: [LocationViewModel])
    func goToRestaurant(viewController: UIViewController)
}

class RouteViewController: KazooieViewController, RouteDisplayLogic {
	var presenter: RoutePresentationLogic?
	var params: RouteParametersLogic?
    var fpc: FloatingPanelController?

    @IBOutlet private weak var mapView: MKMapView!

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

        self.title = self.presenter?.getName()
        self.presenter?.loadRestaurants()
        addCustomizedNextBtn()
	}

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        fpc?.removePanelFromParent(animated: animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFloatingPanel()
        navigationController?.navigationBar.tintColor = UITheme.Colors.primary
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func addCustomizedNextBtn() {
        let rightButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(saveTapped))
        rightButton.image = UIImage(named: "check")
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func loadFloatingPanel() {
        fpc = FloatingPanelController()
        fpc?.delegate = self
        let contentVC = RestaurantsViewController()
        contentVC.presenter = self.presenter
        fpc?.set(contentViewController: contentVC)
        fpc?.track(scrollView: contentVC.getTableView())
        fpc?.addPanel(toParent: self)
        fpc?.surfaceView.cornerRadius = 9.0
    }

    func setPins(locations: [LocationViewModel]) {
        for location in locations {
            let london = MKPointAnnotation()
            london.title = location.name
            london.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
            mapView.addAnnotation(london)
        }
        mapView.zoomToFitMapAnnotations()
    }

    @IBAction func saveTapped(_ sender: Any) {
        self.presenter?.saveRoute()
    }

    func goToRestaurant(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension RouteViewController: FloatingPanelControllerDelegate, MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else {
            return nil
        }
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
}
