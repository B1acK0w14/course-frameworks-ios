//
//  MacBook.swift
//  ARCExample
//
//  Created by David Andres Penagos Sanchez on 20/05/20.
//  Copyright © 2020 David Andres Penagos Sanchez. All rights reserved.
//

import Foundation

class MacBook {
    
    let name: String
    weak var owner: Person?
    
    init(name: String, owner: Person?) {
        self.name = name
        self.owner = owner
    }
    
    deinit {
        print("MacBook named \(name) is being deinitialized")
    }
}
