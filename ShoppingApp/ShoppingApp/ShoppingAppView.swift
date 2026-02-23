//
//  ShoppingAppView.swift
//  ShoppingApp
//
//  Created by David Penagos on 9/02/26.
//

import SwiftUI

struct ShoppingAppView: View {
    // MARK - Variables
    @ObservedObject var viewModel: ShoppingViewModel
    @State var showAlertAddItems: Bool = false
    @State var showAlertEditItems: Bool = false
    @State var showAlertRemoveItems: Bool = false
    @State var showAlertFilterItems: Bool = false
    @State private var titleItem = ""
    @State private var newTitleItem = ""
    @State private var titleDescription = ""
    
    init(viewModel: ShoppingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            List(viewModel.shoppingItems) { item in
                Text(item.title)
            }
            
            List(viewModel.filteredShoppingItems) { item in
                Text(item.title)
            }
            
            HStack {
                Button {
                    showAlertAddItems.toggle()
                } label: {
                    Text("Add Item")
                }.buttonStyle(.bordered)
                
                Button {
                    showAlertEditItems.toggle()
                } label: {
                    Text("Edit Item")
                }.buttonStyle(.bordered)
                
                Button {
                    showAlertRemoveItems.toggle()
                } label: {
                    Text("Remove Item")
                }.buttonStyle(.bordered)
                
                Button {
                    showAlertFilterItems.toggle()
                } label: {
                    Text("Filter Item")
                }.buttonStyle(.bordered)
            }
        }
        .padding()
        .task {
            viewModel.callAppServices()
        }
        .alert("Add items!", isPresented: $showAlertAddItems) {
            TextField("Add the title item", text: $titleItem)
            TextField("Add the description item", text: $titleDescription)
            Button("Ok", role: .confirm) {
                viewModel.addItem(title: titleItem)
                titleItem = ""
                titleDescription = ""
            }
            Button("Close", role: .cancel) {}
        }
        .alert("Edit items!", isPresented: $showAlertEditItems) {
            TextField("Add the title of the item to edit", text: $titleItem)
            TextField("Add the new title", text: $newTitleItem)
            TextField("Add the new description", text: $titleDescription)
            Button("Ok", role: .confirm) {
                viewModel.editItem(oldTitle: titleItem, newTitleItem: newTitleItem)
                titleItem = ""
                titleDescription = ""
                newTitleItem = ""
            }
            Button("Close", role: .cancel) {}
        }
        .alert("Remove items!", isPresented: $showAlertRemoveItems) {
            TextField("Add the title of the item to remove", text: $titleItem)
            Button("Ok", role: .confirm) {
                viewModel.removeItem(title: titleItem)
                titleItem = ""
                titleDescription = ""
            }
            Button("Close", role: .cancel) {}
        }
        .alert("Filter items!", isPresented: $showAlertFilterItems) {
            TextField("Add the string of the items to filter", text: $titleItem)
            Button("Ok", role: .confirm) {
                viewModel.filterByItem(item: titleItem)
                titleItem = ""
                titleDescription = ""
            }
            Button("Close", role: .cancel) {}
        }
        .alert(isPresented: $viewModel.alertError) {
            Alert(title: Text("Failure action"), message: Text("Something went wrong"), dismissButton: .cancel())
        }
    }
}

#Preview {
    ShoppingAppView(viewModel: ShoppingViewModel())
}
