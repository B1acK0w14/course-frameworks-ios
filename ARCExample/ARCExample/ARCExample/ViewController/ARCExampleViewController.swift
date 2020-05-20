//
//  ARCExampleViewController.swift
//  ARCExample
//
//  Created by David Andres Penagos Sanchez on 20/05/20.
//  Copyright © 2020 David Andres Penagos Sanchez. All rights reserved.
//

import UIKit

class ARCExampleViewController: UIViewController {
    
    //MARK: - Properties
    var david: Person?
    var pcDavid: MacBook?

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createObjects()
        assignProperties()
    }
    
    func createObjects() {
        david = Person(name: "David", macbook: nil)
        pcDavid = MacBook(name: "PC-David", owner: nil)
    }
    
    func assignProperties() {
        david?.macbook = pcDavid
        pcDavid?.owner = david
        
        david = nil
        pcDavid = nil
    }
}

