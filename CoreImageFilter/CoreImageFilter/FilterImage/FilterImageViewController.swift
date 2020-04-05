//
//  FilterImageViewController.swift
//  CoreImageFilter
//
//  Created by David Penagos on 4/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit

class FilterImageViewController: UIViewController {

    //MARK: - Properties
    private lazy var filterImageView: FilterImageView = {
        let view = FilterImageView()
        return view 
    }()
    
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
        self.view = filterImageView
    }
}

