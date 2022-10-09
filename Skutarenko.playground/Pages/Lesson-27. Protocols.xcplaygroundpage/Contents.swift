protocol EntryName: Priority {
    var label: String { get }
}

protocol Priority {
    var order: Int { get }
}

class Student: EntryName {
    var firstName: String
    var lastName: String
    var label: String {
        return firstName + " " + lastName
    }
    let order = 1
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Cow: EntryName {
    var name: String?
    var label: String {
        return name ?? "a cow"
    }
    let order = 2
}

struct Grass: EntryName {
    var type: String
    var label: String {
        return "Grass is " + type
    }
    let order = 3
}

func printFarm(_ array: [EntryName]) {
    var newArray = array
    newArray.sort(by: {a, b in
        if a.order == b.order {
            return a.label < b.label
        } else {
            return a.order < b.order
        }
    })
    
    for value in newArray {
        print(value.label)
    }
}

// MARK: DEMO

let student1 = Student(firstName: "Bob", lastName: "Kot")
let student2 = Student(firstName: "Kate", lastName: "Black")
let student3 = Student(firstName: "John", lastName: "Crew")

let cow1 = Cow()
cow1.name = "Burenka"
let cow2 = Cow()

let grass1 = Grass(type: "Green")
let grass2 = Grass(type: "St. Augustine")

var array: [EntryName] = [cow1, student1, student2, grass1, student3, cow2, grass2]

printFarm(array)
