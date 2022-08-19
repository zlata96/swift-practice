import Foundation

class Human {
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    deinit {
        print("Human deinitialized")
    }
    
    func test() {
        
    }
}


enum Color: Int {
    case black
    case white
    
    init?(_ value: Int) {
        switch value {
        case 0: self = Color.black
        case 1: self = Color.white
        default: return nil
        }
    }
}

let a = Color(-1)
let b = Color(rawValue: 0)

struct Size {
    var width: Int
    var height: Int
    
    init?(width: Int, height: Int) {
        self.width = width
        if height < 0 {
            return nil
        }
        self.height = height
    }
}

class Friend: Human {
    var name: String
    
    let skin: Color = {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
    }()
    
    init?(name: String) {
        self.name = name
        super.init(weight: 0, age: 0)
        if name.isEmpty {
            return nil
        }
    }
    
    required init() {
        self.name = "Hi"
        super.init(weight: 0, age: 0)
    }
    
    deinit {
        print("Friend deinitialized")
    }
}

let f = Friend(name: "")

class BestFriend: Friend {
    override init(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    
    required init() {
        super.init()
    }
    
    deinit {
        print("BestFriend deinitialized")
    }
}

let f1 = Friend()
f1.skin.rawValue
let f2 = Friend()
f2.skin.rawValue
let f3 = Friend()
f3.skin.rawValue
let f4 = Friend()
f4.skin.rawValue

struct Test {
    var bestFriend: BestFriend? = BestFriend(name: "")
}

var test: Test? = Test()

test!.bestFriend = nil

var f5 = Friend(name: "")
