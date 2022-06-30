// Properties:
// stored properties - свойства, которые сохраняют данные в самой Property
// computed properties - свойства, которые вычисляют значение, чтобы не хранить данные
import Foundation

struct Student {
    var firstName: String {
        // если мы не указываем новую переменную, то swift самостоятельно указывает ее как newValue/oldValue, без доп. инициализации
        willSet {
            print("will set " + newValue + " instead of " + firstName)
        }
        didSet {
            print("did set " + firstName + " instead of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            print("fullName wants to be set to " + newValue)
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
}

var student = Student(firstName: "Alex", lastName: "Black")

student.firstName = "Bob"
student.lastName
student.fullName

student.fullName = "ivan IVanov"
student.firstName
student.lastName
student.fullName
