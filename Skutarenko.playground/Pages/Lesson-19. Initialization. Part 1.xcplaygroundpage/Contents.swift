class Student1 {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init() {
        self.firstName = ""
        self.lastName = ""
    }
}

class Student2 {
    var firstName = ""
    var lastName = ""
}

class Student3 {
    var firstName: String
    var lastName: String
    
    init(_ firstName: String, _ lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student4 {
    var middleName: String?
}

class Student5 {
    let maxAge: Int
    
    init() {
        maxAge = 100
    }
}

/*class Student6: Student5 {
    override init() {
        super.maxAge = 110
    }
}
 дочерние не могут менять родительские константы! */

struct Student7 {
    var firstName: String
    var lastName: String
}

let st1 = Student1()
let st2 = Student2()
let st3 = Student3("a", "b")
let st7 = Student7(firstName: "a",lastName: "b")

///
// designated - осуществляют установку всех stored проперти - init
// conviniens - удобныеБ но не содержат все параметры при вызове, не вызывают родительские методы, только в рамках своего класса

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
    
    func test() {
        
    }
}

let h1 = Human(weight: 70, age: 20)
let h2 = Human(weight: 0, age: 20)
let h3 = Human(age: 5)

class Student: Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName    // stage 1, пока не закончится ничего нельзя делать в инициализаторе
        
        super.init(weight: 0, age: 0)
        test()
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}

let student = Student(firstName: "a")
