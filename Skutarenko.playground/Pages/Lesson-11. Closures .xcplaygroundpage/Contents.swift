// Closures - функция, которая передается в другую функцию

import Foundation

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 7, 4, 2, 1]

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
    var filtered = [Int]()
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}

// inline closures

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 0
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 1
})

// short form
// trailing closures - если слоужер в самом конце, то ее можно вывести за скобки
filterArray(array: numbers, f: { value in value % 3 == 0 })
filterArray(array: numbers) { value in value % 3 == 0 }
filterArray(array: numbers) { $0 % 3 == 0 }

// клоужеры используют переменные из общего потока, сразу в контекст, происходит копирование в функцию

