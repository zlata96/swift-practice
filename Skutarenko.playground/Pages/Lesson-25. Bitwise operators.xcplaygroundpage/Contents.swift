//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

extension UInt8 {
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

var a: UInt8 = 57
print(a)
