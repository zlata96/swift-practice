import UIKit

struct Student {
    var name: String
    var totalScore: Int
}

let students = [Student(name: "One", totalScore: 80),
                Student(name: "Oner", totalScore: 88),
                Student(name: "Onere", totalScore: 98),
                Student(name: "Oneeg", totalScore: 56),
                Student(name: "Onew", totalScore: 34)]

var topStudentFilter: (Student) -> Bool = { student in
    return student.totalScore > 80
}

func topStudentFilterF(student: Student) -> Bool {
    return student.totalScore > 70
}

let topStudents = students.filter { $0.totalScore > 80
}

for topStudent in topStudents {
    print(topStudent.name)
}

