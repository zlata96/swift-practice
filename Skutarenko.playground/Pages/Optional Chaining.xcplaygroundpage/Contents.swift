//: [Previous](@previous)

import Foundation

class Adress {
    var street = "Dekabristov"
    var number = "1"
    var city = "London"
    var country = "USA"
}

struct Garage {
    var size = 2
}

class House {
    var rooms = 1
     var adress = Adress()
    var garage: Garage? = Garage()
}

class Car {
    var model = "Zaporojec"
    
    func start() {
    }
}

class Person {
    var cars: [Car]? = [Car()]
    var house: House? = House()
}

let p = Person()

p.house?.garage?.size = 3

if p.house?.garage?.size != nil {
    print("upgrade")
} else {
    print("Failure")
}


if p.cars?[0].start() != nil {
    print("start")
} else {
    print("Failure")
}
