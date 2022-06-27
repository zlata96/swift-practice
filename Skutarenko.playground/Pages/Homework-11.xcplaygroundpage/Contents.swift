// TASK 1:

// Пример пустого closure 
func onlyPrint(f: () -> ()) {
    for i in 1...10 {
        print(i)
        f()
    }
}

onlyPrint {
    print("test")
}

// TASK 2:

var array = [1, 2, 85, 3, 26, 4, 7, 132]

array.sorted { a, b in return a > b }
array.sorted { a, b in a > b }
array.sorted { $0 > $1 }
array.sorted(by: > )

// TASK 3:
// Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную. Используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.

func sortedYou(array: [Int], f: (Int, Int?) -> Bool) -> Int? {
    var optional: Int?
    for number in array {
        if f(number, optional) {
            optional = number
        } 
    }
    return optional
}

sortedYou(array: array) { $1 == nil ? true : $0 > $1! }
sortedYou(array: array) { $1 == nil ? true : $0 < $1! }
