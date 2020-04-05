//
//  ViewConfiguration.swift
//  CoreImageFilter
//
//  Created by David Penagos on 4/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

public protocol ViewConfiguration: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupViewConfiguration()
}

public extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {
    }
}
