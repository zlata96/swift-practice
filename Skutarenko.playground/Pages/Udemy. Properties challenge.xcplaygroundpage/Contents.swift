import Foundation

var width: Float = 3.4
var height: Float = 2.1

let singleBucket: Float = 1.5

var bucketsOfPaint: Int {
    get {
        let squareOfRoom = width * height
        let roundedBucket = ceilf(squareOfRoom / singleBucket)
        return Int(roundedBucket)
    }
    set {
        var area = Float(newValue) * singleBucket
        print("You can paint room with \(area) meters square" )
    }
}
print(bucketsOfPaint)
bucketsOfPaint = 10
