//
//  CGAffineTransformViewController.swift
//  CGAffineTransform
//
//  Created by David Penagos on 3/06/25.
//

import UIKit

class CGAffineTransformViewController: UIViewController, CGAffineTransformDelegate {
    
    //MARK: - Properties
    private lazy var cgAffineTransformView: CGAffineTransformView = {
        let view = CGAffineTransformView(delegate: self)
        return view
    }()
    
    var currentAnimation = 0
    
    //MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        self.view = cgAffineTransformView
    }
    
    //MARK: - Functions
    func applyAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
            switch self.currentAnimation {
            case 0:
                self.cgAffineTransformView.image.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.cgAffineTransformView.button.transform = CGAffineTransform(translationX: 0, y: 60)
                self.cgAffineTransformView.image.transform = CGAffineTransform(rotationAngle: 180)
            default:
                break
            }
        }, completion: { _ in
            self.cgAffineTransformView.image.transform = .identity
            self.cgAffineTransformView.button.transform = .identity
        })
    }
}

