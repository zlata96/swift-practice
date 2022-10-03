//: [Previous](@previous)

import Foundation

class Symbol {
    
}

class A: Symbol {
    func aa() {
        
    }
}

class B: Symbol {
    func bb() {
        
    }
}

let array: [Any] = [A(), B(), Symbol(), A(), A(), B(), NSObject(), "a", 5]
var aCount = 0
var bCount = 0
var sCount = 0

for value in array {
    if value is A {
        aCount += 1
    } else if value is B {
        bCount += 1
    } else if value is Symbol {
        sCount += 1
    }
    if let a = value as? A {
        a.aa()
    } else if let b = value as? B {
        b.bb()
    }
    if value is NSString {
        print(value)
    }
}

aCount
bCount
sCount
