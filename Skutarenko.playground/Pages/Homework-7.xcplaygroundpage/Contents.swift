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

let birthdayDoB = (month: 10, day: 22)
var sumOfDaysBeforeBTHD = 0
for i in 0...birthdayDoB.month - 2 {
    sumOfDaysBeforeBTHD += daysOfMonth[i]
}
sumOfDaysBeforeBTHD += birthdayDoB.day
print("There are \(sumOfDaysBeforeBTHD) days will be passed since the beggining of the year until my birthday")

// TASK 2:

let optionalArray: [Int?] = [5, nil, 4583, 67, nil]
var sumOfElements = 0

// a) Optional binding

for i in 0...optionalArray.count - 1 {
    if let a = optionalArray[i] {
    sumOfElements += a
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
// string - > array

var englishAlphabetArray = Array(englishAlphabet)

for i in 0...englishAlphabetArray.count - 1 {
    reversedEnglishAlphabetArray.append(String(englishAlphabetArray[englishAlphabet.count - 1 - i]))
}

print(reversedEnglishAlphabetArray)

// Second way:
// reversed()

reversedEnglishAlphabetArray = []

for character in englishAlphabet {
    reversedEnglishAlphabetArray.append(String(character))
}
reversedEnglishAlphabetArray = reversedEnglishAlphabetArray.reversed()

print(reversedEnglishAlphabetArray)
