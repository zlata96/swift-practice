//: [Previous](@previous)

import Foundation

extension Int {
    func isPositive() {
        if self >= 0 {
            print("The value is positive")
        } else {
            print("The value is negative")
        }
    }
    
    func isZero() -> Bool {
        if self != 0 {
            return false
        } else {
            return true
        }
    }
}

extension String {
    var counter: Int {
        get {
            var count = 0
            for _ in self {
                count += 1
            }
            return count
        }
    }
    
    subscript(value: Int) -> String {
        if value <= self.count-1 {
            return self[value]
        } else {
            return "There is no symbol with this value"
        }
    }
    
    func truncate(value: Int) -> String {
        var newString = ""
        if value >= self.count - 1 {
            newString = self
        } else {
            for i in 0...(value - 1) {
                newString.append(self[i])
            }
            newString.append("...")
        }
        return newString
    }
}

// MARK: DEMO

let a = 9
let b = -8
let c = 0
let string = "Hello, world!"
string.count
string.counter
a.isZero()
a.isPositive()
b.isPositive()
c.isZero()
print(string[4])
print(string.truncate(value: 3))
