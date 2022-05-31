// TASK 1: How many diferent symbols in string

let bigString = "It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.However little known the feelings or views of such a man 193791032!@#%^&*()<__+=..."
bigString.count

var countOfVowels = 0
var countOfConsonants = 0
var countOfOtherSymbols = 0
for character in bigString {
    switch character {
    case "a", "e", "i", "o", "u", "y":
        countOfVowels += 1
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x":
        countOfConsonants += 1
    default:
        countOfOtherSymbols += 1
    }
}

print("There are \(countOfVowels) vowels, \(countOfConsonants) consonants and \(countOfOtherSymbols) other symbols in our string")

// TASK 2: determine the period of life

var age = 25

switch age {
case 0...12:
    print("childhood")
case 13...16:
    print("teenager age")
case 17...22:
    print("youth")
case 23...35:
    print("maturity 1")
case 35...60:
    print("maturity 2")
default:
    print("elderly age")
}

// TASK 3: name of your student

typealias FullNameOfStudent = (name: String, patronymic: String, lastName: String)

let secondStudent: FullNameOfStudent = ("Ольга", "Николаевна", "Иванова")
let firstStudent: FullNameOfStudent = ("Евгений", "Владимирович", "Воронов")
let thirdStudent: FullNameOfStudent = ("Елена", "Александровна","Зябликова")
let fourthStudent: FullNameOfStudent = ("Николай", "Иванович", "Фирсов" )

func sayHello(to student: FullNameOfStudent) {
    switch student.name.first {
    case "А", "О":
        print(student.name)
    default:
        switch student.lastName.first {
        case "В", "Д":
            print(student.name + " " + student.patronymic)
        case "З", "Е":
            print(student.lastName)
        default:
            print("\(student.name) \(student.patronymic) \(student.lastName)")
        }
    }
}

sayHello(to: firstStudent)
sayHello(to: secondStudent)
sayHello(to: thirdStudent)
sayHello(to: fourthStudent)

// TASK 4
typealias Coordinate = (x: Int, y: Int)

let ship1: [Coordinate] = [(1,4), (1,5)]
let ship2: [Coordinate] = [(5,6)]
let ship3: [Coordinate] = [(5,10), (6,10), (7,10)]

let ships = [ship1, ship2, ship3]

func shoot(by coordinateShoot: Coordinate) -> String {
    for ship in ships {
        for coordinateShip in ship {
            if coordinateShip == coordinateShoot && ship.count == 1 {
                return "Убил"
            } else if coordinateShip == coordinateShoot && ship.count != 1 {
                return "Ранил"
            }
        }
    }
return "Мимо"
}

print(shoot(by: (5, 6)))
print(shoot(by: (0, 0)))
print(shoot(by: (1, 4)))
