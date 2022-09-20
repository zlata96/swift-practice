import UIKit

//let defaults = UserDefaults.standard
//let sharedURLSession = URLSession.shared

class Car {
    var colour = "Red"
    
}

var myCar = Car()
myCar.colour = "Blue"

var yourCar = Car()
yourCar.colour

class CarOne {
    var colour = "Red"
    
    static let singeltonCar = CarOne()
}

let myCarOne = CarOne.singeltonCar
myCarOne.colour = "Green"
let yourCarOne = CarOne.singeltonCar
print(yourCarOne.colour)
