//
//  DashboardViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/9/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol DashboardDisplayLogic: class {
    func navigateToNewRoute(vc: UIViewController)
    func reloadTableView()
}

class DashboardViewController: KazooieViewController, DashboardDisplayLogic {
	var presenter: DashboardPresentationLogic?
	public var params: DashboardParametersLogic?

    @IBOutlet private weak var tableView: UITableView!

	// MARK: Object lifecycle
	init() {
		super.init(nibName: String(describing: DashboardViewController.self),
			bundle: Bundle(for: DashboardViewController.classForCoder()))
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
        title = "Routes"
        configTableView()
        self.presenter?.loadRestaurants()
        addCustomizedNewBtn()
	}

    private func addCustomizedNewBtn() {
        let rightButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(newTapped))
        rightButton.image = UIImage(named: "new")
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    func configTableView() {
        tableView.register(UINib(nibName: DashboardTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: DashboardTableViewCell.reuseIdentifier)
    }

    @IBAction func newTapped(_ sender: Any) {
        self.presenter?.presentNewRoute()
    }

    func navigateToNewRoute(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAmountOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectRowAt(index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DashboardTableViewCell = tableView.dequeueReusableCell(withIdentifier: DashboardTableViewCell.reuseIdentifier, for: indexPath) as? DashboardTableViewCell else {
            return UITableViewCell()
        }
        if let information = self.presenter?.getRowFor(index: indexPath.row) {
            cell.setupData(name: information.0, number: information.1)
        }
        return cell
    }

}
