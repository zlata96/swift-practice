// enum - value type когда пердаем оно копируется
// могут иметь функции, быть расширенными и тп

import Foundation
 
enum Action {
    case walk(meters: Int)              //ассоциативные значения
    case run(meters: Int, speed: Int)
    case stop
    case turn(direction: Direction)
    enum Direction : String {                    // внутренний тип
        case left = "Left!"
        case right = "Right!"
    }
}

var action = Action.run(meters: 20, speed: 15) // тип Action, а значение Run

action = .stop
action = .walk(meters: 10)
action = .turn(direction: .left)

switch action {
case .stop:
    print("Stop")
case .walk(let meters) where meters < 100:
    print("Short Walk")
case .walk(_):
    print("Long walk")
case .run(let m, let s):
    print("Run \(m) meters with \(s) speed")
case .turn(let dir) where dir == .left:
    print("Turn Left")
case .turn(let dir) where dir == .right:
    print("Turn Right")
default: break
}

print(Action.Direction.left.rawValue)
