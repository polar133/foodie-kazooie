//
//  LocationViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol LocationDisplayLogic: class {
    func showLoading()
    func hideLoading()
    func goToSelection(viewController: UIViewController)
}

class LocationViewController: KazooieViewController, LocationDisplayLogic {
	var presenter: LocationPresentationLogic?
    var params: LocationParametersLogic?

    let regionRadius: CLLocationDistance = 1000
    @IBOutlet private weak var mapView: MKMapView!
    fileprivate var locationManager: CLLocationManager = CLLocationManager()

	// MARK: Object lifecycle
	init() {
		super.init(nibName: String(describing: LocationViewController.self),
                   bundle: Bundle(for: LocationViewController.classForCoder()))
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
        self.title = "Current location"
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        mapView.showsUserLocation = true
	}

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.delegate = self
        navigationController?.navigationBar.tintColor = UITheme.Colors.primary
        navigationController?.navigationBar.prefersLargeTitles = false
        locationManager.startUpdatingLocation()
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    @IBAction func continueAction(_ sender: Any) {
        let lat = Double(locationManager.location?.coordinate.latitude ?? 0)
        let lon = Double(locationManager.location?.coordinate.longitude ?? 0)
        self.presenter?.locationSelected(lat: lat, lon: lon)
    }

    func goToSelection(viewController: UIViewController) {
        DispatchQueue.main.sync { [weak self] in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension LocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedAlways {
            //TODO: Change for a location list
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            centerMapOnLocation(location: location)
        }
    }
}
