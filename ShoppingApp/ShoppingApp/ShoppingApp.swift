//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by David Penagos on 9/02/26.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ShoppingAppView(viewModel: ShoppingViewModel())
        }
    }
}
