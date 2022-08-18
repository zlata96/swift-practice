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
    
    func test() {
        
    }
}

class Student: Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        test()
    }
    /* override init(weight: Int, age: Int) {
        self.firstName = ""
        self.lastName = ""
        super.init(weight: weight, age: age)
    }*/
    
    override convenience init(weight: Int, age: Int) {
        self.init(firstName: "")
        self.weight = weight
        self.age = age
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}

class Doctor: Student {
    var fieldOfStudy: String = ""
    
    init(fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(firstName: "Doctor", lastName: "House")
    }
    // переопределяем родительские init, чтобы появился доступ к ним, т.к. есть собственный init
    
    override init(firstName: String, lastName: String) {
        self.fieldOfStudy = "Health"
        super.init(firstName: firstName, lastName: lastName)
    }
    
    /*override init(weight: Int, age: Int) {
        self.fieldOfStudy = ""
        super.init(weight: weight, age: age)
    }*/
    /*
    convenience init(fieldOfStudy: String) {
        self.init(firstName: "Doctor", lastName: "House")
        self.fieldOfStudy = fieldOfStudy
    }
     //используем, если у себя не создаем designated, при этом наследуем все init у родителя
     */
    
    convenience init(firstName: String) {
        self.init(fieldOfStudy: "Math")
        self.age = 35
        self.firstName = firstName
    }
}

let s1 = Student()
let d1 = Doctor(firstName: "aaa")
d1.age
let d2 = Doctor(fieldOfStudy: "Health Care")
let d3 = Doctor()



