//
//  KitDynamicViewController.swift
//  KitDynamic
//
//  Created by David Penagos on 10/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit

class KitDynamicViewController: UIViewController {
    
    //MARK: - Properties
    private lazy var kitDynamicView: KitDynamicView = {
        let view = KitDynamicView(delegate: self)
        return view
    }()
    
    var animator: UIDynamicAnimator? = UIDynamicAnimator()

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
        self.view = kitDynamicView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    //MARK: - Functions
    func gradesToRadians(grades: Double) -> Double {
        return (grades * 180) / .pi
    }
}

extension KitDynamicViewController: KitDynamicDelegate {
    
    func applyEfect() {
        guard let animator = self.animator else {return}
        
        //ANNOTATION: - Set efect of push
        let push = UIPushBehavior(items: [self.kitDynamicView.kitDynamicLabel], mode: .instantaneous)
        push.angle = CGFloat(gradesToRadians(grades: 90))
        push.magnitude = 5
        animator.addBehavior(push)
        
        //ANNOTATION: - Set efect of collision
        let collisionEffect = UICollisionBehavior(items: [self.kitDynamicView.kitDynamicLabel, self.kitDynamicView.kitDynamicImageView])
        collisionEffect.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionEffect)
        
        //ANNOTATION: - Set efect of gravity
        let gravityEffect = UIGravityBehavior(items: [self.kitDynamicView.kitDynamicLabel])
        animator.addBehavior(gravityEffect)
        
        //ANNOTATION: - Set efect of elasticity
        let dynamicEffect = UIDynamicItemBehavior(items: [self.kitDynamicView.kitDynamicLabel])
        dynamicEffect.elasticity = 0.75
        animator.addBehavior(dynamicEffect)
        
        //ANNOTATION: - Set efect of union
        let unionEffect = UIAttachmentBehavior(item: self.kitDynamicView.kitDynamicLabel, attachedTo: self.kitDynamicView.kitDynamicImageView)
        unionEffect.frequency = 20
        unionEffect.damping = 1
        animator.addBehavior(unionEffect)
    }
}

