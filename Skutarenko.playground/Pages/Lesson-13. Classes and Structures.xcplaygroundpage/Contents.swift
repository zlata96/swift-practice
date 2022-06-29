// class это инструкция, которая объединяет свойства объекта; более глобальные чем структуры 
// экземпляр класса это референс тайп, создается указатель на одну ячейку, поэтому при смене значений у одного указателя, будет меняться у всех, тк меняется объект, на который все указывают

class StudentClass {
    var name: String
    var age: Int
    
    init() {                            // конструктор
        name = "No name"
        age = 20
    }
    
    init(name: String, age: Int){     // конструктор
        self.name = name             // self к property указывает на текущий экземпляр
        self.age = age
    }
}

// create object of class

let stClass1 = StudentClass(name: "Bob", age: 18)

stClass1.name = "Alex"                                     // у класса, даже если экземпляр с let, мы можем менять  (пока property var, если property let, то можем использовать только из конструктора значение или дефолтное )
stClass1.age = 21

var stClass2 = stClass1

stClass2.name = "AAA"
stClass2.age = 20

stClass1
stClass2

// структура это велью тайп, поэтому происходит копирование
struct StudentStruct {
    var name: String
    var age: Int
}

var stStruct1 = StudentStruct(name: "Sam", age: 24)      // у структуры, чтобы поменять property, необходимо чтобы и экземпляр и property были var

//stStruct1.name = "Kate"
//stStruct1.age = 25

var stStruct2 = stStruct1

stStruct2.name = "Kate"
stStruct2.age = 25

stStruct2.age
stStruct2.name

stStruct1.name
stStruct1.age 

func addOneYear(student: StudentClass) {
    student.age += 1
}

func addOneYear(student: inout StudentStruct) {
    student.age += 1
    student
}

// спросить у Богдана про var в функции 
stStruct1
addOneYear(student: &stStruct1)
stStruct1


stClass1
addOneYear(student: stClass1)
stClass1
stClass2

var arrayStruct = [stStruct1]
arrayStruct[0]
arrayStruct[0].age = 50
arrayStruct[0]
stStruct1

var arrayClass = [stClass1]
arrayClass[0]
arrayClass[0].age = 50
arrayClass[0]
stClass1
