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
        let view = FilterImageView(delegate: self)
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

extension FilterImageViewController: FilterImageDelegate {
    
    func applyFilter() {
        //ANNOTATION: - Create a new queue with priority
        let queue = DispatchQueue(label: "queue", qos: .userInteractive)
        queue.async {
            let imageCoreImage = CIImage(cgImage: (self.filterImageView.filterImageView.image?.cgImage)!)
            //ANNOTATION: - Create a new type of filter for apply the image
            let filter = CIFilter(name: "CIGaussianBlur")
            //ANNOTATION: - Apply filter
            filter?.setValue(imageCoreImage, forKey: kCIInputImageKey)
            let context = CIContext(options: nil)
            let ref = context.createCGImage((filter?.outputImage)!, from: (filter?.outputImage?.extent)!)
            
            DispatchQueue.main.async {
                self.filterImageView.filterImageView.image = UIImage(cgImage: ref!)
            }
        }
    }
    
    func applyUnfilter() {
        if let image = UIImage(named: "ExampleImage") {
            filterImageView.filterImageView.image = image
        }
    }
}
