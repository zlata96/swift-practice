struct Point {
    var x: Int
    var y: Int
    
   /* mutating func move(by x: Int, and y: Int) {
        self.x += x
        self.y += y
    } */
    
    mutating func move(by x: Int, and y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
     }
}
// self указывает на того, кто его вызвал

enum Color {
    
    static func numberOfElements() -> Int {
        return 2
    }
    case white
    case black
    
    mutating func invert() {
        self = self == .white ? .black : .white
    }
}

var c: Color = .white
c.invert()

Color.numberOfElements()

var p1 = Point(x: 1, y: 1)
p1.move(by: 4, and: 4)
p1

var p2 = Point(x: 0, y: 0)
