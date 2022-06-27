// TASK 1:

func heart() -> String {
    return "\u{2764}"
}
func kiss() -> String {
    return "\u{1F48B}"
}
func tiger() -> String {
    return "\u{1F42F}"
}

print("I \(heart()) you,\(tiger())! \(kiss())")

// TASK 2:

var chessDict = [String: Bool]()
let x = ["1","2","3","4","5","6","7","8"]
let y = ["a","b","c","d","e","f","g","h"]

// Determine chess table (chessDict)
var value = false
for i in x {
    value.toggle()
    for j in y {
        chessDict[i + j] = value
        value.toggle()
    }
}

func getColor(x: String, y: String) -> String {
    if let chessValue = chessDict["\(x)\(y)"] {
        return chessValue ? "white" : "black"
    } else {
        return "error"
    }
}

getColor(x: "1", y: "a")
getColor(x: "1", y: "b")
getColor(x: "1", y: "c")
getColor(x: "1", y: "abc")

// TASK 3:

var array = [1, 34, 18, 33, 827, 19]

func getReversedArray(array: [Int]) -> [Int] {
    var result: [Int] = []
    for i in 0...array.count - 1 {
        result.append(array[array.count - 1 - i])
    }
    return result
}

array = getReversedArray(array: array)

// TASK 4:

var array2 = [1, 2, 3, 4, 5, 6]

func reversedArray(array: inout [Int]) {
    for i in 0...(array.count - 1)/2 {
        let temp = array[array.count - 1 - i]
        array[array.count - 1 - i] = array[i]
        array[i] = temp
    }
}

reversedArray(array: &array2)

func fact(_ number: Int) -> Int {
    if number == 1 {
        return 1
    }
    print(number * fact(number - 1))
    return number * fact(number - 1)
}

fact(1)
fact(2)
fact(3)
fact(4)
fact(5)

