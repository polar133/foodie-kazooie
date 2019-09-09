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
            let images = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
            let image = UIImage(named: "\(images.randomElement() ?? 1)")
            guard let url = URL(string: photoURL) else {
                self.photoImage.image = image
                return
            }
            self.photoImage.sd_setImage(with: url, placeholderImage: image)
        }
    }

}
