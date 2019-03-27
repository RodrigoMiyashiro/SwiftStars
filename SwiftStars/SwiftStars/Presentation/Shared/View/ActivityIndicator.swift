//
//  ActivityIndicator.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ActivityIndicator: UIView {
    lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = self.center
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configureBackgroundView()
        self.configureActivityIndicator()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureBackgroundView() {
        let color = UIColor.lightGray
        self.backgroundColor = color.withAlphaComponent(0.8)
    }

    private func configureActivityIndicator() {
        self.addSubview(self.spinner)
        self.spinner.startAnimating()
    }
}
