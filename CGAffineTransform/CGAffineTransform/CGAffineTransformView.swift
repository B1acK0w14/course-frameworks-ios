//
//  CGAffineTransformView.swift
//  CGAffineTransform
//
//  Created by David Penagos on 3/06/25.
//

import UIKit

class CGAffineTransformView: UIView {
    
    //MARK: - Properties
    public var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.image = UIImage(systemName: "figure.archery")
        image.contentMode = .scaleToFill
        return image
    }()
    
    public var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Press it", for: .normal)
        button.addTarget(self, action: #selector(applyAnimation), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: CGAffineTransformDelegate?
    
    //MARK: - Init
    init(delegate: CGAffineTransformDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc func applyAnimation() {
        self.delegate?.applyAnimation()
    }
}

extension CGAffineTransformView: ViewConfiguration {
    
    func configureViews() {
        self.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(image)
        self.addSubview(button)
    }
    
    func setupConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1)
        ])
    }
}
