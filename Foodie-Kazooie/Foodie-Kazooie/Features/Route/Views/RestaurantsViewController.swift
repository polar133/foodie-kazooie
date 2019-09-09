//
//  RestaurantsViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    weak var presenter: RoutePresentationLogic?

    // MARK: Object lifecycle
    init() {
        super.init(nibName: String(describing: RestaurantsViewController.self),
                   bundle: Bundle(for: RestaurantsViewController.classForCoder()))
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont.kazooie_boldFont(withSize: 23)
        configTableView()
    }

    func getTableView() -> UITableView {
        return self.tableView
    }

    func configTableView() {
        tableView.register(UINib(nibName: RestaurantTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: RestaurantTableViewCell.reuseIdentifier)
    }

    func reloadTableView() {
        tableView.reloadData()
    }

}

extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAmountOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectRowAt(index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RestaurantTableViewCell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.reuseIdentifier, for: indexPath) as? RestaurantTableViewCell else {
            return UITableViewCell()
        }
        if let information = self.presenter?.getRowFor(index: indexPath.row) {
            cell.setInformation(name: information.0, photoURL: information.1)
        }
        return cell
    }

}
