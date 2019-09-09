//
//  KazooieViewController.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

open class KazooieViewController: UIViewController {

    private var loadingView: LoadingView?
    private var errorView: ErrorView?

    override open func viewDidLoad() {
        UILabel.appearance().tintColor = UITheme.Colors.fontColor
        self.view.backgroundColor = UITheme.Colors.background
        super.viewDidLoad()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearNavigationBar()
        addCustomizedBackBtn()
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UITheme.Colors.primary]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        setNeedsStatusBarAppearanceUpdate()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    private func clearNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func addCustomizedBackBtn() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left")
        navigationController?.navigationBar.tintColor = UITheme.Colors.primary
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func showLoading() {
        DispatchQueue.main.async {
            self.loadingView = LoadingView(frame: self.view.bounds)
            self.loadingView?.addToView(self.view, equalTo: self.view)
            self.loadingView?.startLoading()
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingView?.endLoading()
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }

    func showError(msg: String) {

    }

    func hideError() {

    }
}
