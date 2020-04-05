//
//  FilterImageView.swift
//  CoreImageFilter
//
//  Created by David Penagos on 4/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit
import SnapKit

class FilterImageView: UIView {
    
    //MARK: - Properties
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
}

extension FilterImageView: ViewConfiguration {
    func configureViews() {
        self.backgroundColor = .red
    }
    
    func buildViewHierarchy() {
    }
    
    func setupConstraints() {
    }
}
