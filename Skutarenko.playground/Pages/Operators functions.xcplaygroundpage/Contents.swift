struct Point {
    var x: Int
    var y: Int
}

infix operator %%%
infix operator **: AdditionPrecedence

extension Point{
    static func + (a: Point, b: Point) -> Point {
        return Point(x: a.x + b.x, y: a.y + b.y)
    }
    static func * (a: Point, b: Point) -> Point {
        return Point(x: a.x * b.x, y: a.y * b.y)
    }
    
    static func += (a: inout Point, b: Point) {
        a = a + b
    }
    static func == (a: Point, b: Point) -> Bool {
        return a.x == b.x && a.y == b.y
    }
    static prefix func - (a: Point) -> Point {
        return Point(x: -a.x, y: -a.y)
    }
    static func %%% (a: inout Point, b: Point) -> Point {
        a.x += b.x
        a.y -= b.y
        return a
    }
    static func ** (a: Point, b: Point) -> Point {
        return Point(x: 2*(a.x + b.x), y: 2*(a.y + b.y))
    }
}

// MARK: DEMO

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)
var p3 = p1 + p2
p3
p1 += p2
p1 == p2
p1 = -p1
p1 %%% p2
p1 ** p2 ** p1

