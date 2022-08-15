class Human {
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    } // чтобы нельзя было в  дальнейшем менять в дочерних классах используем final
}
// базовые классы - класс, который ни от чего не наследуются, но есть дочерние у него
// наследуются только классы (главное отличие от структур); структуры и энумы не наследуются

class Kid: Human {
    // переопределяем функцию (полностью заменили родительский метод)
    override func sayHello() -> String {
            return "agu"
        }
    
    override var firstName: String {
        set {
            super.firstName = newValue + " :)"
        }
        get {
            return super.firstName
        }
    }
    
    override var lastName: String {
        didSet {
            print("new value " + self.lastName )
        }
    }
    
    override var fullName: String {
        return firstName
    }
}

class SmartHuman: Human {
    
}

class Student: SmartHuman {
    override func sayHello() -> String {
        return super.sayHello() + " my friend" // дополняем родительский метод, здесь все равно обращается к родителю - Human
    }
}

let human = Human()
human.firstName = "Bob"
human.lastName = "Black"
human.sayHello()

let kid = Kid()
kid.firstName = "Bob jr."
kid.lastName = "White"
kid.fullName
kid.sayHello()

let student = Student()
student.firstName = "Max"
student.lastName = "Crew"
student.sayHello()

let array = [kid, student, human]

for value in array {
    print(value.sayHello())
}

