//
//  DashboardTableViewCell.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/9/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet private weak var amountView: UIView!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var logoImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func setupData(name: String, number: String) {
        self.titleLabel.text = name
        self.amountLabel.text = number
        self.amountView.layer.cornerRadius = self.amountView.bounds.height / 4
        let images = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        logoImage.image = UIImage(named: "\(images.randomElement() ?? 1)")
        amountView.backgroundColor = UITheme.Colors.primary
    }

}
