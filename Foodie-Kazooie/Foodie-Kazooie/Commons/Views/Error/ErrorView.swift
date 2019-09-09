//
//  ErrorView.swift
//  Foodie-Kazooie
//
//  Created by Carlos Jimenez on 9/7/19.
//  Copyright © 2019 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol ErroViewDelegate: class {
    func didTapTryAgain(in errorView: ErrorView)
}

class ErrorView: UIView {

    @IBOutlet private weak var errorDescriptionLabel: UILabel!
    @IBOutlet private weak var errorImageView: UIImageView!
    @IBOutlet private weak var tryAgainButton: UIButton! {
        didSet {
            tryAgainButton.layer.masksToBounds = true
            tryAgainButton.layer.cornerRadius = 4
        }
    }

    // MARK: - Properties

    var contentView: UIView?
    weak var delegate: ErroViewDelegate?
    var errorDescription: String {
        get {
            return errorDescriptionLabel.text ?? ""
        }
        set (newValue) {
            errorDescriptionLabel.text = newValue
        }
    }

    func setTitleTryAgainButton(title: String) {
        tryAgainButton.setTitle(title, for: .normal)
    }

    func setImageError(image: UIImage) {
        self.errorImageView.image = image
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    // MARK: - Load xib

    private func xibSetup() {
        let contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        self.contentView = contentView
    }

    @IBAction private func tryAgain(_ sender: Any) {
        delegate?.didTapTryAgain(in: self)
    }

    func backgroundColor(color: UIColor) {
        contentView?.backgroundColor = color
    }
}
