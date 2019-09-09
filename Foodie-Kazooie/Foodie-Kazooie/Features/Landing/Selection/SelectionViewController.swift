//
//  SelectionViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright (c) 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol SelectionDisplayLogic: class {
    func showLoading()
    func hideLoading()
    func goToRoute(viewController: UIViewController)
    func reloadTableView(index: Int?)
}

class SelectionViewController: KazooieViewController, SelectionDisplayLogic {
	var presenter: SelectionPresentationLogic?
	var params: SelectionParametersLogic?

    @IBOutlet private weak var tableView: UITableView!

	// MARK: Object lifecycle
	init() {
		super.init(nibName: String(describing: SelectionViewController.self),
                   bundle: Bundle(for: SelectionViewController.classForCoder()))
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
        self.title = "Select your preferences"
        configTableView()
        presenter?.loadCategories()
        presenter?.loadCuisines()
        addCustomizedNextBtn()
	}

    private func addCustomizedNextBtn() {
        let rightButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(addTapped))
        rightButton.image = UIImage(named: "right")
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func configTableView() {
        tableView.register(UINib(nibName: "SelectionHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "SelectionHeader")
        tableView.register(UINib(nibName: SelectionTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: SelectionTableViewCell.reuseIdentifier)
    }

    func reloadTableView(index: Int?) {
        if let row = index {
            tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
        } else {
            tableView.reloadData()
        }
    }

    @IBAction func addTapped(_ sender: Any) {
        self.presenter?.buildRoute()
    }

    func goToRoute(viewController: UIViewController) {
        DispatchQueue.main.sync { [weak self] in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SelectionHeader") as? SelectionHeader else {
            return nil
        }
        headerView.presenter = self.presenter
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAmountOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectRowAt(index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: SelectionTableViewCell.reuseIdentifier, for: indexPath) as? SelectionTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(viewModel: presenter?.getRowFor(index: indexPath.row))
        cell.presenter = self.presenter
        return cell
    }

}
