// TASK 1: How many seconds have passed since the beggining of the year until my birthday?

let minute = 60
let hour = minute * 60
let day = hour * 24
let month31 = day * 31
let month30 = day * 30
let month28 = day * 28
let sumOfTheSeconds = month31 * 5 + month30 * 3 + month28 + day * 22
print("There are \(sumOfTheSeconds) seconds will be passed since the beggining of the year until my birthday")

// TASK 2: What quarter is your birthday's month?

let monthOfBirthday = 10
let f = (monthOfBirthday - 1) / 3

if f == 0 {
    print("\(monthOfBirthday) month is the first quarter")
} else if f == 1 {
    print("\(monthOfBirthday) month is the second quarter")
} else if f == 2 {
    print("\(monthOfBirthday) month is the third quarter")
} else if f == 3 {
    print("\(monthOfBirthday) month is the fourth quarter")
}


// TASK 3: What color the cell based on coordinates

let coordinateOne = 3
let coordinateTwo = 5
let x = coordinateOne % 2
let y = coordinateTwo % 2

if x != 0 || y != 0 {
    print("The color of cell is black")
} else {
    print("The color of cell is white")
}

