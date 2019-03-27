//
//  CodeView.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol CodeView {
    func setup()
    func setupComponents()
    func setupConstraints()
    func setupExtraConfigurations()
}

extension CodeView {
    func setup() {
        self.setupComponents()
        self.setupConstraints()
        self.setupExtraConfigurations()
    }
}
