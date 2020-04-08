//
//  SpeechExampleView.swift
//  SpeechExample
//
//  Created by David Penagos on 7/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit
import SnapKit

class SpeechExampleView: UIView {
    //MARK: - Properties
    public lazy var speechExampleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .red
        return textView
    }()
    
    public lazy var speechExampleButton: UIButton = {
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
        button.addTarget(self, action: #selector(startRecognizeVoice), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: SpeechExampleDelegate?
    
    //MARK: - Init
    init(delegate: SpeechExampleDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    //MARK: - Actions
    @objc func startRecognizeVoice() {
        self.delegate?.startRecognizeVoice()
    }
}

extension SpeechExampleView: ViewConfiguration {
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(speechExampleTextView)
        self.addSubview(speechExampleButton)
    }
    
    func setupConstraints() {
        speechExampleTextView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(64)
            make.trailing.equalToSuperview().offset(-64)
        }
        
        speechExampleButton.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(speechExampleTextView.snp.bottom).offset(40)
        }
    }
}
