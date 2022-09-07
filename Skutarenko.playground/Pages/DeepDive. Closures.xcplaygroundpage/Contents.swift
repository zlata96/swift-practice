//: [Previous](@previous)


func calculator (n1: Int, n2: Int, operation: (Int, Int)-> Int) -> Int {
    return operation(n1, n2)
}

func add (no1: Int, no2: Int) -> Int {
    return no1 + no2
}

print(calculator(n1: 2, n2: 3) {$0 * $1})

let array = [6, 2, 3, 9, 4, 1]



let newArray = array.map{"\($0)"}
print(newArray)
