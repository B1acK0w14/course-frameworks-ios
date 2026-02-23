//
//  ShoppingViewModel.swift
//  ShoppingApp
//
//  Created by David Penagos on 9/02/26.
//

import SwiftUI
import Combine

class ShoppingViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var shoppingItems: [ShoppingAppPlaceholder] = []
    @Published var filteredShoppingItems: [ShoppingAppPlaceholder] = []
    @Published var alertError: Bool = false
    
    private var counterId: Int = 2
    private var shoppingAppServices = ShoppingAppServices()
    
    // MARK: - Functions
    func addItem(title: String) {
        shoppingItems.append(ShoppingAppPlaceholder(userId: counterId, id: counterId, title: title, completed: true))
        counterId += 1
    }
    
    func removeItem(title: String) {
        let index = shoppingItems.firstIndex { item in
            item.title == title
        }
        
        if let index = index {
            shoppingItems.remove(at: index)
        } else {
            alertError.toggle()
        }
    }
    
    func editItem(oldTitle: String, newTitleItem: String) {
        let index = shoppingItems.firstIndex { item in
            item.title == oldTitle
        }
        
        if let index = index {
            shoppingItems[index].title = newTitleItem
        } else {
            alertError.toggle()
        }
    }
    
    func filterByItem(item: String) {
        filteredShoppingItems = shoppingItems.filter { $0.title.lowercased().contains(item.lowercased()) }
    }
    
    func callAppServices() {
        shoppingAppServices.callShoppingService { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.shoppingItems = success
                }
            case .failure:
                DispatchQueue.main.async {
                    self.shoppingItems = []
                }
            }
        }
    }
}
