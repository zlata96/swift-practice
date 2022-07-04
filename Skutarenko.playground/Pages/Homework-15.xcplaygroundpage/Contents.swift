/* TASK 1: Создать структуру “Описание файла” содержащую свойства:
 - путь к файлу
 - имя файла 
 - максимальный размер файла на диске
 - путь к папке, содержащей этот файл
 - тип файла (скрытый или нет)
 - содержимое файла (можно просто симулировать контент)

 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.*/

enum TypeOfFile {
    case hidden
    case visible
}

struct File {
    static let maxFileSize = 1000000
    
    var name: String
    var typeOfFile: TypeOfFile
    var size: Int {
        didSet {
            if size > File.maxFileSize {
                size = oldValue
            }
        }
    }
    var fileFolder: String
    var pathToFile: String {
        fileFolder + "/" + name
    }
    var content: String
}

let newFile = File(name: "ВКР черновик", typeOfFile: .visible, size: 100, fileFolder: "ВКР", content: "Глава 1")

newFile.pathToFile

/* TASK 2: Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет */

enum Colors: Int, CaseIterable {
    case red = 0xFF0000
    case green = 0x00FF00
    case blue = 0x0000FF
    
    static var countOfColors = Colors.allCases.count
    static var firstColor = Colors.blue
    static var finalColor = Colors.green
}

Colors.red.rawValue
Colors.countOfColors

/* TASK 3: Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
 - минимальный и максимальный возраст каждого объекта
 - минимальную и максимальную длину имени и фамилии
 - минимально возможный рост и вес
 - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса */

class Human {
    static let maxAge = 110
    static let minAge = 1
    static let minLenght = 1
    static let nameMaxLenght = 15
    static let surnameMaxLenght = 15
    static let minWeight = 10
    static let minHeight = 50
    
    static var count = 0
    
    var name: String {
        didSet {
            if name.count > Human.nameMaxLenght || name.count < Human.minLenght {
                name = "Error"
            }
        }
    }
    
    var surname: String {
        didSet {
            if surname.count > Human.nameMaxLenght || surname.count < Human.minLenght {
                surname = "Error"
            }
        }
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = Human.maxAge
            } else if age < Human.minAge {
                age = Human.minAge
            }
        }
    }
    
    var weight: Int {
        didSet {
            if weight < Human.minWeight {
                weight = Human.minWeight
            }
        }
    }
    
    var height: Int {
        didSet {
            if height < Human.minHeight {
                height = Human.minHeight
            }
        }
    }
    
    init(name: String, surname: String, age: Int, weight: Int, height: Int) {
        self.name = name
        self.surname = surname
        self.age = age
        self.weight = weight
        self.height = height
            
        Human.count += 1
    }
}

let human1 = Human(name: "ksuhdfisjf/s;odjfkSkfZdrfijafijz/eij'pai`", surname: "Black", age: 0, weight: 5, height: 45)
let human2 = Human(name: "Jane", surname: "Smith", age: 18, weight: 67, height: 170)

Human.count
human1
human1.name = "55555w;ejciaicjafjhca,jkfchbajuchaeu,jchaeju"
human1
