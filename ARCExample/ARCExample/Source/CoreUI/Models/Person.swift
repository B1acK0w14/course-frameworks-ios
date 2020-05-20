//
//  Person.swift
//  ARCExample
//
//  Created by David Andres Penagos Sanchez on 20/05/20.
//  Copyright © 2020 David Andres Penagos Sanchez. All rights reserved.
//

import Foundation

class Person {
    
    let name: String
    var macbook: MacBook?
    
    init(name: String, macbook: MacBook?) {
        self.name = name
        self.macbook = macbook
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
