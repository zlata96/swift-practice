// TASK 1:

let a: String? = nil
let b: String? = "Apple"
let c: String? = "123"
let d: String? = nil
let e: String? = "ZlatikKosatik"

let sumInterpolation = "\(a ?? "")\(b ?? "")\(c ?? "")\(d ?? "")\(e ?? "")"
let sumConcatenation = (a ?? "") + (b ?? "") + (c ?? "") + (d ?? "") + (e ?? "")

// TASK 2:

let character1: Character = "💩"
let character2: Character = "\u{265F}"
let character3: Character = "\u{1F33C}"
let character4: Character = "Ⓑ"
let character5: Character = "😒"
var sumOfCharacter = "\(character1)\(character2)\(character3)\(character4)\(character5)"
print("There are \(sumOfCharacter.count) characters in string \(sumOfCharacter)")

// TASK 3:

let englishAlphabet = "abcdefghijklmnopqrstuvwxyz"
let char1: Character = "k"

var index = 0
for char in englishAlphabet {
    if char == char1 {
        print("Index of \(char1) is \(index)")
    }
    index += 1
}
