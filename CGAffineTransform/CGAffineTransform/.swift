//
//  FilterImageDelegate.swift
//  CGAffineTransform
//
//  Created by David Penagos on 3/06/25.
//


import Foundation

protocol FilterImageDelegate: class {
    func applyFilter()
    func applyUnfilter()
}