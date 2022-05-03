let one = "14"
let two = "twenty years"
let three = "7 years"
let four = "25"
let five = "9 years"

let oneInt = Int(one)
let twoInt = Int(two)
let threeInt = Int(three)
let fourInt = Int(four)
let fiveInt = Int(five)

var sumAll = 0

if let oneInt = oneInt {
    sumAll = sumAll + oneInt
}

if let twoInt = twoInt {
    sumAll = sumAll + twoInt
}

if let threeInt = threeInt {
    sumAll = sumAll + threeInt
}

if let fourInt = fourInt {
    sumAll = sumAll + fourInt
}

if let fiveInt = fiveInt {
    sumAll = sumAll + fiveInt
}

print("SUM = \(sumAll)")



// TASK 1: if statusCode from 200 to 300 to show message, else show errorMessage
typealias Response = (statusCode: Int?, message: String?, errorMessage: String?)

let firstTuple: Response = (200, "OK", nil)
let secondTuple: Response = (404, nil, "ERROR")

func checkTuple(tuple: Response) {
    if let
        statusCode = tuple.statusCode,
        statusCode >= 200 && statusCode <= 300,
        let message = tuple.message {
            print(message)
    } else {
        print(tuple.errorMessage!)
    }
}

checkTuple(tuple: firstTuple)
checkTuple(tuple: secondTuple)

// TASK 2: need to check every parameter in tuple
typealias Response2 = (message: String?, errorMessage: String?)

let thirdTuple: Response2 = (nil, "ERROR")
let fourthTuple: Response2 = ("OK", nil)

func checkTuple2(tuple: Response2) {
    if let message = tuple.message {
        print(message)
    } else if let errorMessage = tuple.errorMessage {
        print(errorMessage)
    }
}

checkTuple2(tuple: thirdTuple)
checkTuple2(tuple: fourthTuple)

// TASK 3:
typealias Student = (name: String?, carNumber: String?, grade: Int?)

let firstStudent: Student = ("Bogdan", "7086AK16", 3)
let secondStudent: Student = ("Zlata", nil, 5)
let thirdStudent: Student = ("Mark", nil, nil)
let fourthStudent: Student = ("Eva", "1234AK16", nil)

func printInfo(tuple: Student) {
    if let name = tuple.name {
        if let carNumber = tuple.carNumber {
            if let grade = tuple.grade {
                print ("Student \(name) has car \(carNumber) and grade \(grade)")
            } else {
                print("Student \(name) has car \(carNumber) and didn't pass last exam")
            }
        } else if let grade = tuple.grade {
            print("Student \(name) hasn't car and grade \(grade)")
        } else {
            print("Student \(name) hasn't car and didn't pass last exam")
        }
    }
}

printInfo(tuple: firstStudent)
printInfo(tuple: secondStudent)
printInfo(tuple: thirdStudent)
printInfo(tuple: fourthStudent)
