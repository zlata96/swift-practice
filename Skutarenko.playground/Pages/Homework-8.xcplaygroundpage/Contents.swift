// TASK 1

var myStudents: [String: Int] = ["Mary Green": 3, "Jane Eyre": 4, "William Shakespeare": 5, "Oscar Wilde": 4, "Bob Night": 2]

// a) update 2 values

myStudents["Mary Green"]!+=2
myStudents["Bob Night"]!+=1

// b) add 2 students

myStudents["Andy Smitt"] = 4
myStudents["Kate Smitt"] = 5

// c) remove 2 students

myStudents["Mary Green"] = nil
myStudents.removeValue(forKey: "William Shakespeare")

// d) find sum of total score and GPA

var totalScore = 0
for key in myStudents.keys {
    totalScore += (myStudents[key] ?? 0)
}

var gradeAverage = Double(totalScore / (myStudents.keys.count))
print("The total score of my students is \(totalScore) and GRA is \(gradeAverage)")

// TASK 2

var dictOftheYear = ["Jan": 31, "Feb": 28, "Mar": 31, "Apr": 30, "May": 31, "Jun": 30, "Jul":31, "Aug":31, "Sep":30, "Oct":31, "Nov":30, "Dec":31]

// a) print using tuples

for (key, value) in dictOftheYear {
    print("There are \(value) days in \(key)")
}

// b) print using arrays of keys

for key in Array(dictOftheYear.keys) {
    print("There are \(dictOftheYear[key] ?? 0) days in \(key)")
}

// TASK 3

var dict = [String:Bool]()
let x = ["1","2","3","4","5","6","7","8"]
let y = ["a","b","c","d","e","f","g","h"]
var value = true

for i in x {
    value.toggle()
    for j in y {
        dict[i + j] = value
        value.toggle()
    }
}
print(dict)
