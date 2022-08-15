/*TASK 1: Создайте базовый класс артист с "именем", "фамилией" и методом "выступление". У каждого дочернего класса свой метод "выступление" (актер - играет, клоун - развлекает, танцор - танцует), включающее в себя представление участника, в каком жанре выступление и действие (можно просто вывод строки). Создайте дочерний класс "художник", который не хочет, чтобы его называли вы и всегда ставит другое имя, когда вы пытаетесь его назвать. Положить все экземпляры в один массив и пройдясь по нему вызвать у всех выступление.*/
class Artist {
    var firstName: String
    var lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func performance() -> String {
        return fullName + " "
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Dancer: Artist {
    override func performance() -> String {
        return super.performance() + "dance"
    }
}

class Actor: Artist {
    override func performance() -> String {
        return super.performance() + "play"
    }
}

class Clown: Artist {
    override func performance() -> String {
        return super.performance() + "entertain"
    }
}

class Painter: Artist {
    override var fullName: String {
          return "Black Swan"
    }
    
    override func performance() -> String {
        return super.performance() + "paint"
    }
}

let painter = Painter(firstName: "Bob", lastName: "Brown")
painter.fullName

let clown = Clown(firstName: "Kate", lastName: "Pops")
let actor = Actor(firstName: "John", lastName: "Black")
let dancer = Dancer(firstName: "Mad", lastName: "Max")

let array: [Artist] = [painter, clown, actor, dancer]

for value in array {
    print(value.performance())
}

/* TASK 2: Базовый класс - "транспортное средство"; свойства - скорость, вместимость, стоимость одной перевозки (все computed properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В. При перевозке 100 и 1000 человек ответить на следующие вопросы:
 -Как быстро мы сможем это сделать и каким транспортом?
 -Стоимость всех перевозок и количество?
 -Какой транспорт быстрее справится и какой более выгодный? */

class Transport {
    var speed: Int {
        return 0
    }
    var capacity: Int {
        return 0
    }

    var cost: Int {
        return 0
    }
    
    func calculateTime(distance: Int) -> Int {
        return distance / speed
    }
    
    func calculateMoney(passangers: Int) -> Int {
        if passangers > capacity {
            return (passangers / capacity + 1) * cost
        } else {
            return cost
        }
    }
}

class Plane: Transport {
    override var speed: Int {
        return 10000
    }
    override var capacity: Int {
        return 180
    }
    override var cost: Int {
        return 1400000
    }

}

class Car: Transport {
    override var speed: Int {
        return 100
    }
    override var capacity: Int {
        return 4
    }
    override var cost: Int {
        return 2000
    }
}

class Train: Transport {
    override var speed: Int {
        return 200
    }
    override var capacity: Int {
        return 400
    }
    override var cost: Int {
        return 400000
    }
}

class Ship: Transport {
    override var speed: Int {
        return 200
    }
    override var capacity: Int {
        return 150
    }
    override var cost: Int {
        return 600000
    }
}
 
// MARK: DEMO

let car = Car()
let plane = Plane()
let train = Train()
let ship = Ship()

let transports: [Transport] = [car, plane, train, ship]

for value in transports {
    print(value.calculateTime(distance: 100000))
    print("\(value.calculateMoney(passangers: 100))" + "\n")
}

/* TASK 3: Создать пять разных классов, для которых потом создать родительский, таким образом чтобы группировать эти пять. Посчитать количество объектов каждого вида (четвероногие, пресмыкающиеся, животные, живые существа)
 */

class Сreature {
    var quadrupeds: Bool
    var isAlive: Bool
    var animal: Bool
    var reptiles: Bool
    
    init(quadrupeds: Bool, isAlive: Bool, animal: Bool, reptiles: Bool) {
        self.quadrupeds = quadrupeds
        self.isAlive = isAlive
        self.animal = animal
        self.reptiles = reptiles
    }
}

class Human: Сreature { }

class Dogs: Сreature { }

class Monkey: Сreature { }

class Crocodile: Сreature { }

// MARK: DEMO

let human1 = Human(quadrupeds: false, isAlive: true, animal: false, reptiles: false)
let human2 = Human(quadrupeds: false, isAlive: true, animal: false, reptiles: false)
let dog1 = Dogs(quadrupeds: true, isAlive: true, animal: true, reptiles: false)
let dog2 = Dogs(quadrupeds: true, isAlive: true, animal: true, reptiles: false)
let monkey1 = Monkey(quadrupeds: true, isAlive: true, animal: true, reptiles: false)
let monkey2 = Monkey(quadrupeds: true, isAlive: true, animal: true, reptiles: false)
let crocodile1 = Crocodile(quadrupeds: true, isAlive: true, animal: true, reptiles: true)
let crocodile2 = Crocodile(quadrupeds: true, isAlive: true, animal: true, reptiles: true)

let creatures = [human1, human2, dog1, dog2, monkey1, monkey2, crocodile1, crocodile2]

var countQuadrupeds = 0
var countAlives = 0
var countAnimals = 0
var countReptiles = 0

for creature in creatures {
    if creature.quadrupeds == true {
        countQuadrupeds += 1
    }
    if creature.isAlive == true {
        countAlives += 1
    }
    if creature.animal == true {
        countAnimals += 1
    }
    if creature.reptiles == true {
        countReptiles += 1
    }
}

print("countQuadrupeds = \(countQuadrupeds)" + "\n" + "countAlives = \(countAlives)" + "\n"  + "countAnimals = \(countAnimals)" + "\n" + "countReptiles = \(countReptiles)")
