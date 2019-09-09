//
//  RoundedFullButton.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

class RoundedFullButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: 50)])
    }

    override class var requiresConstraintBasedLayout: Bool {
        return true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4
        self.backgroundColor = UITheme.Colors.primary
        self.layer.borderColor = UITheme.Colors.disable.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UITheme.Colors.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.kazooie_semiBoldFont(withSize: 15)
    }

}
