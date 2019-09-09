//
//  SelectionHeader.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

class SelectionHeader: UITableViewHeaderFooterView {

    @IBOutlet private weak var segmentControl: UISegmentedControl!
    weak var presenter: SelectionPresentationLogic?

    override func awakeFromNib() {
        segmentControl.tintColor = UITheme.Colors.primary
        self.contentView.backgroundColor = UITheme.Colors.background
    }

    @IBAction func segmentControlChangeValue(_ sender: UISegmentedControl) {
        presenter?.setSegmentSelected(index: segmentControl.selectedSegmentIndex)
    }

}
