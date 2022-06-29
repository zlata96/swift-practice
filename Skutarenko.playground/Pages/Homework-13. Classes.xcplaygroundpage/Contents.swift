// TASK 1: Создайте класс студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров класса и заполните их данными. Положите их всех в массив (журнал).

class Student {
    var name: String
    var surname: String
    var age: Int
    var gpa: Double
    
    init(name: String, surname: String, age: Int, gpa: Double) {
        self.name = name
        self.surname = surname
        self.age = age
        self.gpa = gpa
    }
}

var student1 = Student(name: "Мария", surname: "Иванова", age: 21, gpa: 4.6)
var student2 = Student(name: "Наталья", surname: "Иванова", age: 21, gpa: 3.2)
var student3 = Student(name: "Иван", surname: "Бадьянов", age: 20, gpa: 5.0)
var student4 = Student(name: "Дантес", surname: "Карлов", age: 21, gpa: 3.6)

var myJournal = [student1, student2, student3, student4]

// TASK 2: Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1. индекс массива но + 1
 
func showDate(students: [Student]) {
    for (index, student) in students.enumerated() {
        print("\(index + 1). \(student.name) \(student.surname), \(student.age) years old, GPA = \(student.gpa)")
    }
}

showDate(students: myJournal)

// TASK 3: С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

func sortedByGPARates(students: inout [Student]) -> [Student] {
    students = students.sorted { $0.gpa > $1.gpa }
    return students
}

sortedByGPARates(students: &myJournal)

// TASK 4: Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

func sortedBySurnames(students: inout [Student]) -> [Student] {
    students = students.sorted { ($0.surname + $0.name) < ($1.surname + $1.name) }
    return students
}

sortedBySurnames(students: &myJournal)

// TASK 5: Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var myNewJournal = myJournal

myJournal[0].name = "Котик"
myJournal[1].surname = "Поповчук"
myJournal[2].age = 56
myJournal[3].gpa = 2.0

myJournal
myNewJournal

