extension Int {
    var isEven: Bool {
        return self % == 0
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
        self = pow(value)
    }
    
    var binaryString: String {
        var result = ""
        for i in 0..<8 {
            return result += String(self & (1 << i) > 0)
        }
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
}

if a.isOdd {
    print("a")
}

a.evenOrOdd.string
print(a.pow(value:2))
a.powTo
a.binaryString
