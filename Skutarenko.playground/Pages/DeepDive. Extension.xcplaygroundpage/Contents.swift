import Foundation
import UIKit


extension Double {
    func round(to places: Int) -> Double {
       let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}
var myDouble = 3.1232

myDouble.round(to: 3)

let a = 4.2467382

a.round(to: 1)

