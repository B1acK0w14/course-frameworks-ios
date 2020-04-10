//
//  ViewConfiguration.swift
//  KitDynamic
//
//  Created by David Penagos on 10/04/20.
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
