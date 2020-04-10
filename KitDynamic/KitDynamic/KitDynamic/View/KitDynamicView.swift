//
//  KitDynamicView.swift
//  KitDynamic
//
//  Created by David Penagos on 10/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit
import SnapKit

class KitDynamicView: UIView {
    //MARK: - Properties
    public lazy var kitDynamicImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.image = UIImage(named: "ExampleImage")
        image.contentMode = .scaleToFill
        return image
    }()
    
    public lazy var kitDynamicButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleEdgeInsets =  UIEdgeInsets(top: 0, left: 0.6, bottom: 0, right: 0.6)
        button.addTarget(self, action: #selector(applyEfect), for: .touchUpInside)
        return button
    }()
    
    public lazy var kitDynamicLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 4
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.text = "Example Label"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    weak var delegate: KitDynamicDelegate?

    //MARK: - Init
    init(delegate: KitDynamicDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    //MARK: - Actions
    @objc func applyEfect() {
        self.delegate?.applyEfect()
    }
}

extension KitDynamicView: ViewConfiguration {
    
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(kitDynamicImageView)
        self.addSubview(kitDynamicButton)
        self.addSubview(kitDynamicLabel)
    }
    
    func setupConstraints() {
        kitDynamicImageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(64)
            make.trailing.equalToSuperview().offset(-64)
        }
        
        kitDynamicButton.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.centerX.equalToSuperview().offset(-60)
            make.top.equalTo(kitDynamicImageView.snp.bottom).offset(40)
        }
        
        kitDynamicLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(130)
            make.top.equalTo(kitDynamicImageView.snp.bottom).offset(40)
            make.leading.equalTo(kitDynamicButton.snp.trailing).offset(20)
        }
    }
}
