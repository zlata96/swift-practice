// TASK 1:

let daysOfMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
print(daysOfMonth)
let nameOfMonth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

for i in 0...daysOfMonth.count - 1 {
    print ("there are \(daysOfMonth[i]) days in \(nameOfMonth[i])")
}

typealias MyTuple = (days: Int, month: String)
var nameAndDaysArray: [MyTuple] = []

for i in 0...daysOfMonth.count - 1 {
    nameAndDaysArray.append((daysOfMonth[i], nameOfMonth[i]))
}

var index = nameAndDaysArray.count - 1

for _ in 0...nameAndDaysArray.count - 1 {
    print(nameAndDaysArray[index])
    index -= 1
}

let date = (month: 10, day: 22)
var sumDays = 0
for i in 0...date.month - 2 {
    sumDays += daysOfMonth[i]
}
sumDays += date.day
print("There are \(sumDays) days will be passed since the beggining of the year until my birthday")

// TASK 2:

let optionalArray: [Int?] = [5, nil, 4583, 67, nil]
var sumOfElements = 0

// a) Optional binding

for element in optionalArray {
    if let element = element {
        sumOfElements += element
    }
}
print(sumOfElements)

// b) Force unwraped

sumOfElements = 0

for i in 0...optionalArray.count - 1 {
    if optionalArray[i] != nil {
        sumOfElements += optionalArray[i]!
    }
}
print(sumOfElements)

// c) ?? (Nil-Coalescing Operator)

sumOfElements = 0

for i in 0...optionalArray.count - 1 {
    sumOfElements += optionalArray[i] ?? 0
}
print(sumOfElements)

// TASK 3: Create reversed array from string

var englishAlphabet = "abcdefghijklmnopqrstuvwxyz"
var reversedEnglishAlphabetArray: [String] = []


// First way:
var englishAlphabetArray = Array(englishAlphabet)

// a) Append

for i in 0...englishAlphabetArray.count - 1 {
    reversedEnglishAlphabetArray.append(String(englishAlphabetArray[englishAlphabet.count - 1 - i]))
}
print(reversedEnglishAlphabetArray)

// b) Insert

reversedEnglishAlphabetArray = []

for element in englishAlphabetArray {
    reversedEnglishAlphabetArray.insert(String(element), at: 0)
}
print(reversedEnglishAlphabetArray)

// Second way:
// Use function reversed()

reversedEnglishAlphabetArray = []

for character in englishAlphabet {
    reversedEnglishAlphabetArray.append(String(character))
}
reversedEnglishAlphabetArray = reversedEnglishAlphabetArray.reversed()
print(reversedEnglishAlphabetArray)

// Additional TASK: Enumerated

var shoppingList = ["Apples", "Eggs", "Milk", "Orange"]
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
