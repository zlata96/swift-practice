//: [Previous](@previous)

import Foundation

// observed properties - triger code, when property was changed
var pizzaInInches = 10 {
    // execute before value will change
    willSet {
        print(pizzaInInches)
        print(newValue)
    }
    // execute after the value was changed
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 33
print(pizzaInInches)

// stored properties
var numberOfPeople = 12
let slicesPerPerson = 4

// computed properties
var numberOfSlices: Int {
    // getter (try to get value)
    get {
        return pizzaInInches - 4
    }
    // set something after we got value
    set {
        print("New numberOfSlices is \(newValue)")
    }
}

numberOfSlices = 12

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

print(numberOfPizza)
numberOfPizza = 4
print(numberOfPeople)


