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
    public lazy var filterImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.image = UIImage(named: "ExampleImage")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Apply Filter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets =  UIEdgeInsets(top: 0, left: 0.4, bottom: 0, right: 0.4)
        button.addTarget(self, action: #selector(applyFilter), for: .touchUpInside)
        return button
    }()
    
    private lazy var unfilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Apply Unfilter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets =  UIEdgeInsets(top: 0, left: 0.6, bottom: 0, right: 0.6)
        button.addTarget(self, action: #selector(applyUnfilter), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: FilterImageDelegate?
    
    //MARK: - Init
    init(delegate: FilterImageDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    //MARK: - Actions
    @objc func applyFilter() {
        self.delegate?.applyFilter()
    }
    
    @objc func applyUnfilter() {
        self.delegate?.applyUnfilter()
    }
}

extension FilterImageView: ViewConfiguration {
    func configureViews() {
        self.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(filterImageView)
        self.addSubview(filterButton)
        self.addSubview(unfilterButton)
    }
    
    func setupConstraints() {
        filterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(64)
            make.trailing.equalToSuperview().offset(-64)
        }
        
        filterButton.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.centerX.equalToSuperview().offset(-60)
            make.top.equalTo(filterImageView.snp.bottom).offset(40)
        }
        
        unfilterButton.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.top.equalTo(filterImageView.snp.bottom).offset(40)
            make.leading.equalTo(filterButton.snp.trailing).offset(20)
        }
    }
}
