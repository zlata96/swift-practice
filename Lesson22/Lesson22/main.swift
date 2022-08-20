var playground = true

class Student {
    //weak var teacher: Teacher?
    unowned var teacher: Teacher

    init(teacher: Teacher) {
        self.teacher = teacher
    }

    deinit {
        print("Goodbye Student")
    }
}

class Teacher {

    var student: Student!

    var test: (() -> ())?

    lazy var test2: (Bool) -> () = {
        [unowned self] (a: Bool) in
        print(self.student)

    }

    init() {
        self.student = Student(teacher: self)
    }

    deinit {
        print("Goodbye Teacher")
    }
}

var closure: (() -> ())?

//var t: Teacher?

if playground {
    var teacher = Teacher()

    teacher.test2(true)

    /*teacher.test = {
        [unowned teacher] in
        print(teacher)
    }*/
    /*if playground {
        var student = Student(teacher: teacher)
        teacher.student = student
    }*/
    /* var student = teacher.student

    closure = {
        [weak student] in
        print(student)
    } */

    print("exit playground")
}

var x = 10
var y = 20

class Human {
    var name = "a"
}

var h = Human()

var closure3: () -> () = {
    [x] in              // capture list [...] in - захватываем фиксированные ссылки
    print("\(x) \(y)")
}

var closure2: (Int) -> Int = { [x,y,h] (a:Int) -> Int in
    print("\(x) \(y) \(h.name)")
    return a
}

closure2(1)

x = 30
y = 40
h = Human()
h.name = "b"

closure2(1)

print("end")

