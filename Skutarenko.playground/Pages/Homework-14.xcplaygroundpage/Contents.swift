// TASK 1: Самостоятельно повторить проделанное в уроке, добавить возраст и ограничение по возрасту

import Foundation

struct Student {
    var firstName: String {
        didSet {
            firstName = firstName.capitalized
        }
    }
    
    var secondName: String {
        didSet {
            secondName = secondName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + secondName
        }
        set {
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                secondName = words[1]
            }
        }
    }
   
    var birthDate: BirthDate
    
    var age: Int {
        let currentYear = Calendar.current.component(.year, from: Date())
        return currentYear - birthDate.year
    }
    
    var yearsAtSchool: Int {
        get {
            if age >= 17 {
                return 11
            } else if age < 6 {
                return 0
            } else {
                return age - 6
            }
        }
    }
}

// TASK 2: Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)

struct BirthDate {
    let day: Int
    let month: Int
    let year: Int
    
    var date: Date? {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)
    }
}

// MARK: DEMO

var student1 = Student(
    firstName: "Daniel",
    secondName: "Carlos",
    birthDate: BirthDate(day: 22, month: 10, year: 1996)
)

student1.fullName
student1.fullName = "penelopa pOPS"
student1.firstName
student1.secondName
student1.fullName

student1.age
student1.yearsAtSchool
student1.birthDate.date


// TASK 3, 4: Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями). При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B

struct Point {
    var x: Double
    var y: Double
}

struct Line {
    var a: Point
    var b: Point
    
    var lenght: Double {
        get {
            sqrt(pow((a.y - b.y), 2) + pow((a.x - b.x), 2))
        }
        set {
            let newX = (a.x + newValue * (b.x - a.x) / lenght)
            let newY = (a.y + newValue * (b.y - a.y) / lenght)
            b = Point (x: newX, y: newY)
        }
    }
    
    var middlePoint: Point {
        get {
            Point(x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
        }
        set {
            let changingX =  newValue.x - middlePoint.x
            let changingY =  newValue.y - middlePoint.y
            
            a.x += changingX
            a.y += changingY
            b.x += changingX
            b.y += changingY
        }
    }
    
}

let dot1 = Point(x: 6, y: 0)
let dot2 = Point(x: 12, y: 0)

var line = Line(a: dot1, b: dot2)
line.middlePoint
line.lenght
line

line.middlePoint = Point(x: 8, y: 0)
line.lenght
line

line.lenght = 20
line.b
