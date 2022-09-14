//: [Previous](@previous)

import Foundation

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water")
    }
    
}

let angela = Human(n: "Angela")
let jack = Human(n: "Jack")
let nemo = Fish(n: "Nemo")
let num = 12
let word: NSString = "asf"
let num1: NSNumber = 13

let neighbours: [Any] = [angela, jack, nemo, num, num1, word]
let neighbours1: [AnyObject] = [angela, jack, nemo] // only class
let neighbours2: [NSObject] = [num1, word] // only NS type

let neighbours3 = neighbours[0]

if neighbours[1] is Human {
    print("The first is Human")
}

func findNemo(from animals: [Any]) {
    for animal in animals {
        if animal is Fish {
            print(animal)
            let fish = animal as! Fish // forced dowcast
            fish.breatheUnderWater()
            let animalFish = fish as Animal // upcast
        }
    }
}

findNemo(from: neighbours)

let fish = neighbours[1] as? Fish
fish?.breatheUnderWater()
