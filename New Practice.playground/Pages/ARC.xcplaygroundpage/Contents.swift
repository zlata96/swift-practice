
var int1 = 10
var int2 = int1

if int1 == int2 {
    print("Two integers are equal")
} else {
    print("Two integers are not equal")
}

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Person instanse doesn't exist now")
    }
}

let personOne = Person(name: "Bob")
personOne.name

let personTwo = personOne
personTwo.name

personOne.name = "Kate"
personTwo.name

var referenceOne: Person?
var referenceTwo: Person?

referenceOne = Person(name: "Jack")
referenceTwo = referenceOne
// сильная ссылка

referenceOne = nil
referenceTwo = nil

class Child {
    let name: String
    var toy: Toy?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Child instanse doesn't exist now")
    }
}

class Toy {
    let name: String
    weak var owner: Child?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Toy instanse doesn't exist now")
    }
}

var child: Child?
var toy: Toy?

child = Child(name: "Jane") // сильная ссылка на Child
toy = Toy(name: "Bear") // сильная ссылка на Toy
child?.toy = toy
toy?.owner = child

child = nil
toy = nil
// instanse still exist

//weak - for optional properties
//unowned - not optional
