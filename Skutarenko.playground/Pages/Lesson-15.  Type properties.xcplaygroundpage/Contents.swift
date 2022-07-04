let maxNameLenght = 10

class Human {
    var name: String {
        didSet {
            if name.count > maxNameLenght {
                name = oldValue
            }
        }
    }
    
    lazy var storyOfMyLife = "This is..." // по умолчанию nil
    
    static var maxAge = 100
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
// объект класса может иметь stored properties, а сам класс нет
// computed properties есть везде

enum Direction {
    static let enumDescription = "Directions in the game"
    case left
    case right
    case top
    case bottom
    
    var isVertical: Bool {
        (self == .top || self == .bottom)
    }
    
    var isHorizontal: Bool {
        return !isVertical
    }
}

let d = Direction.right

d.isVertical
d.isHorizontal

// объект enum не может иметь stored properties, а сам тип может


struct Cat {
    var name: String {
        didSet {
            if  name.count > maxNameLenght {
                name = oldValue
            }
        }
    }
    static let maxAge = 20
    static var totalCats = 0
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
}

// объект структуры не может иметь stored properties, а сам тип структуры может

let human = Human(name: "Peter", age: 40)

human.storyOfMyLife
human

var cat = Cat(name: "WHiten", age: 10)

human.age = 1000
cat.age = 50

let cat1 = Cat(name: "WHiten", age: 10)
let cat2 = Cat(name: "WHiten", age: 10)

Cat.totalCats

cat.name = "djfwfihawehfjfjf"

cat.name
