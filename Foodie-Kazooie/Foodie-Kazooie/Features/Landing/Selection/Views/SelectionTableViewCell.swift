//
//  SelectionTableViewCell.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import SDWebImage

class SelectionTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var logoImage: UIImageView!
    @IBOutlet private weak var blackView: UIView!
    weak var presenter: SelectionPresentationLogic?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        logoImage.sd_cancelCurrentImageLoad()
        logoImage.image = nil
    }

    func setupData(viewModel: SelectionViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        self.nameLabel.text = viewModel.name
        if viewModel.isSelected {
            self.nameLabel.alpha = 1.0
            self.blackView.alpha = 0.3
        } else {
            self.nameLabel.alpha = 0.5
            self.blackView.alpha = 0.6
        }

        if logoImage.image == nil {
            guard let imageUrl = presenter?.getImageFor(id: viewModel.id), let url = URL(string: imageUrl) else {
                return
            }
            self.logoImage.sd_setImage(with: url)
        }
    }
}
