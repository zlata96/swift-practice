//
//  main.swift
//  Lesson 25
//
//  Created by Zlata Guseva on 10/10/2022.
//


protocol Food {
    var name: String { get }
    func taste()
}
protocol Storable {
    var storable: Bool { get }
    var expired: Bool { get }
    var daysToExpire: Int { get }
}

struct Vegetables: Food, Storable {
    var name: String
    var storable: Bool
    var expired: Bool
    var daysToExpire: Int
    func taste() {
        print("Yummy \(self.name)!")
    }
}

struct Fruits: Food, Storable {
    var name: String
    var storable: Bool
    var expired: Bool
    var daysToExpire: Int
    func taste() {
        print("Yummy \(self.name)!")
    }
}

class Medicine: Storable {
    var name: String {
        return label ?? "can't see"
    }
    var label: String?
    var storable: Bool
    var expired: Bool
    var daysToExpire: Int
    
    init(storable: Bool, expired: Bool, daysToExpire: Int) {
        self.storable = storable
        self.expired = expired
        self.daysToExpire = daysToExpire
    }
    
    func taste() {
        print("Feel better!")
    }
}

func putToFridge (array: [Food & Storable]) -> [Food & Storable] {
    var fridge = [Food & Storable]()
    for value in array {
        if value.storable == true && value.expired == false {
            fridge.append(value)
        }
    }
    fridge.sort(by: {a, b in
         if a.daysToExpire == b.daysToExpire {
            return a.name < b.name
        } else {
            return a.daysToExpire < b.daysToExpire
        }
    })
    return fridge
}

var apple = Fruits(name: "apple", storable: true, expired: false, daysToExpire: 4)
var pear = Fruits(name: "pear", storable: true, expired: false, daysToExpire: 4)
var potato = Vegetables(name: "potato", storable: false, expired: false, daysToExpire: 7)
var tomato = Vegetables(name: "tomato", storable: true, expired: true, daysToExpire: 5)
var nurofen = Medicine(storable: false, expired: false, daysToExpire: 100)
var gel1 = Medicine(storable: true, expired: true, daysToExpire: -5)
var gel2 = Medicine(storable: true, expired: false, daysToExpire: 95)

var bag: [Food & Storable] = [apple, pear, potato, tomato, /*nurofen, gel1, gel2*/]
var fridge = putToFridge(array: bag)

for i in 0 ... fridge.count - 1 {
    print("\(fridge[i].name), days \(fridge[i].daysToExpire)")
}
