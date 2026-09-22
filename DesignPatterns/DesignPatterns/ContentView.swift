//
//  ContentView.swift
//  DesignPatterns
//
//  Created by David Penagos on 23/02/26.
//

import SwiftUI

struct ContentView: View {
    @State var decoratorPerson = DecoratorPerson(name: "Pepito", surname: "Perez", age: 30)
    
    var body: some View {
        VStack {
            Button("Decorator Example") {
                decoratorPerson.printTemperature(temperature: 4)
            }.buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
