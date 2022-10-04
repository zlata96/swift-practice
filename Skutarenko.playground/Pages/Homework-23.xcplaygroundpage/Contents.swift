//: [Previous](@previous)

import Foundation

class Human {
    var dad: Man? = Man()
    var mum: Woman? = Woman()
    var sisters: [Woman]? = [Woman()]
    var brothers: [Man]? = [Man()]
}

class Man: Human {
    func push() {
    }
}
class Woman: Human {
    func lead() {
    }
}

var jack = Man()
var ann = Woman()
var kate = Woman()
var ivan = Man()
var jane = Woman()
var marta = Woman()
var ted = Man()
ann.dad = jack
ann.mum = kate
kate.sisters?.append(jane)
kate.sisters?.append(marta)
kate.brothers?.append(ted)
kate.brothers?.append(ivan)

var family = [jack,ann, kate, ivan, jane, marta, ted]
var sCount = 0
var mCount = 0
var wCount = 0
var bCount = 0

for value in family {
    if value is Woman {
        wCount += 1
    } else if value is Man {
        mCount += 1
    }
    if let sisters = value.sisters, !sisters.isEmpty {
        sCount += sisters.count
    }
    if let brothers = value.brothers, !brothers.isEmpty {
        bCount += brothers.count
    }
}

sCount
bCount
mCount
wCount


