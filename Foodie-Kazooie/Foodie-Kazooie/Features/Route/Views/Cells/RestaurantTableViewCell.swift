//
//  RestaurantTableViewCell.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/8/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit
import SDWebImage

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet private weak var lineView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var photoImage: UIImageView!
    @IBOutlet private weak var visitedCheck: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        nameLabel.font = UIFont.kazooie_boldFont(withSize: 16)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.sd_cancelCurrentImageLoad()
        photoImage.image = nil
    }

    func setInformation(name: String, photoURL: String) {
        lineView.backgroundColor = UITheme.Colors.primary
        self.nameLabel.text = name
        if photoImage.image == nil {
            guard let url = URL(string: photoURL) else {
                return
            }
            self.photoImage.sd_setImage(with: url)
        }
    }

}
