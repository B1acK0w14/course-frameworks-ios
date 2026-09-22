//
//  Decorator.swift
//  DesignPatterns
//
//  Created by David Penagos on 23/02/26.
//

// PREMISE: Create a decorator for someone who has cold.

protocol TemperatureEnvironment {
    func isCold(temperature: Int) -> Bool
}

struct Sweater: TemperatureEnvironment {
    func isCold(temperature: Int) -> Bool {
        return temperature > 5 && temperature <= 10
    }
}

struct Jacket: TemperatureEnvironment {
    func isCold(temperature: Int) -> Bool {
        return temperature > 10
    }
}

struct DecoratorPerson {
    let name: String
    let surname: String
    let age: Int
    var isWearingSweater = Sweater()
    var isWearingJacket = Jacket()
    
    func printTemperature(temperature: Int) {
        if isWearingJacket.isCold(temperature: temperature) {
            print("The person is wearing a Jacket")
        } else if isWearingSweater.isCold(temperature: temperature) {
            print("The person is wearing a Sweater")
        } else {
            print("The person is not wearing anything to the cold")
        }
    }
}

