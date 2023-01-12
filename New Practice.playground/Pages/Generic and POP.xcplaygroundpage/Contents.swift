import Foundation

func someFunction<T: Comparable>(x: T, y: T) -> T {
    return y <  x ? y : x
}

// generic method

func log<T: AnyObject>(_ object: T) where T: Equatable {
    print("Info: \(object)")
}

// generic type

struct Box<T: Equatable> {
    let objects: [T]

    func hasObject(_ object: T) -> Bool {
        objects.contains(object)
    }
}

extension Box where T == String {
    func remove(by object: T) {
        /// Logic
    }
}

protocol Event {
    associatedtype Parameter
    associatedtype EventTypes: RawRepresentable where EventTypes.RawValue == String

    var eventName: String { get }
    var eventTypes: EventTypes { get }
    var eventParametr: Parameter { get }
}

struct UserEvent: Event {

    enum UserEvent: String {
        case one
        case two
    }

    var eventName: String
    var eventParametr: String
    var eventTypes: UserEvent
}

struct AuthorizationEvent: Event {

    enum AuthorizationTypes: String {
        case three
        case four
    }

    var eventName: String
    var eventParametr: String
    var eventTypes: AuthorizationTypes
}

func sendEvent<T: Event>(_ event: T) {
}

// MARK: DEMO

someFunction(x: 5, y: 6)
someFunction(x: "a", y: "b")

let box1 = Box(objects: ["123", "4"])
box1.remove(by: "4")
let box2 = Box(objects: [1, 2, 3, 4])

let userEvent = UserEvent(eventName: "", eventParametr: "", eventTypes: .one)
let authorizationEvent = AuthorizationEvent(eventName: "", eventParametr: "", eventTypes: .three)
var events: [any Event] = []

events.append(userEvent)
events.append(authorizationEvent)

