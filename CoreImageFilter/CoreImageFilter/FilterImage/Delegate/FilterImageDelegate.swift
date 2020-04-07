//
//  FilterImageDelegate.swift
//  CoreImageFilter
//
//  Created by David Penagos on 5/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

protocol FilterImageDelegate: class {
    func applyFilter()
    func applyUnfilter()
}
