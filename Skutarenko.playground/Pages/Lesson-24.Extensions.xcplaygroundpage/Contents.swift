extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return !isEven
    }
    
    enum EvenOrOdd {
        case even
        case odd
    }
    
    var evenOrOdd: EvenOrOdd {
        return isEven ? .even : .odd
    }
    
    func pow(value: Int) -> Int {
        var temp = self
        for _ in 1..<value {
            temp *= self
        }
        return temp
    }
    
    mutating func powTo(value: Int) {
        self = pow(value: value)
    }
}

extension Int.EvenOrOdd {
    var string: String {
        switch self {
        case .even:
            return "even"
        case .odd:
            return "odd"
        }
    }
}

extension String {
    init(value: Bool) {
        self.init(value ? 1 : 0)
    }
    
    subscript(start: Int, lenght: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: start)
        let end = self.index(start, offsetBy: lenght)
        return String(self[start..<end])
    }
}

var a = 3
if a.isOdd {
    print("a")
}

a.evenOrOdd.string
print(a.pow(value:2))
a.powTo(value: 2)

let s = "Hello, World!"
s[0, 5]

 
 
