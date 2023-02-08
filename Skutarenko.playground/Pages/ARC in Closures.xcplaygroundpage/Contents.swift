//: [Previous](@previous)

import Foundation

var number = 0

let increaseNumber = {
    number += 1
}

increaseNumber()
increaseNumber()
number

//Retain cyrcle in closures

class Number {
    var value = 0
    lazy var increaseByNumber: (Int) -> () = { [weak self] someNumber in
        guard let self = self else {return }
        self.value += someNumber
    }

    deinit {
        print("The Number instance is about to free")
    }
}

var newNumber: Number?
newNumber = Number()
newNumber?.increaseByNumber(5)
newNumber?.value
newNumber = nil

Number().increaseByNumber(5)

// escaping closures

var completions: [() -> Void] = []

func funcWithEscapingClosure(completion: @escaping () -> Void) {
    completions.append(completion)
}

// DEMO:

class First {
    let second = Second()
    var secondFinished = false
    func makeSecondWork() {
        second.work {
            secondFinished = true
        }
    }

    deinit {
        print("The First instance is about to free")
    }
}

class Second {
    //var finishedWorking: () -> Void = {}
    func work(completion: () -> Void) {
        //finishedWorking = completion
        completion()
    }
}

var first: First?
first = First()
first?.makeSecondWork()
first = nil
