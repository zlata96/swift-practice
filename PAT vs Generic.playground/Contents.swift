import UIKit

protocol Multiplier {
    associatedtype Number
    func multiply (a: Number, b: Number) -> Number
}

class IntNeltiplier: Multiplier {
    func multiply (a: Int, b: Int) -> Int {
        a * b
    }
}

class DoubleNeltiplier: Multiplier {
    typealias Number = Double
    func multiply (a: Double, b: Double) -> Double {
        a * b
    }
}

/// PAT vs Generic
// PAT
protocol WorkerDescriptorProtocol1 {
    associatedtype WorekerType
    func decribeSpeciality(of type: WorekerType)
}

struct OfficeWorker1 {
    var fullName: String
    var age: Int
    var speciality: String
}

class OfficeWorkerDescriptor: WorkerDescriptorProtocol1 {
    typealias WorekerType = OfficeWorker1
    func decribeSpeciality(of type: OfficeWorker1) {
        type.speciality
    }
}

let bob1 = OfficeWorker1(fullName: "Bob Black", age: 25, speciality: "I work hard")
let officeDescriptor = OfficeWorkerDescriptor()
officeDescriptor.decribeSpeciality(of: bob1)

// Generic
protocol WorkerDescriptorProtocol2 {
    func decribeSpeciality()
}

struct OfficeWorker2: WorkerDescriptorProtocol2 {
    func decribeSpeciality() {
        print(speciality)
    }
    var fullName: String
    var age: Int
    var speciality: String
}

func describeSpeciality<WorkerType: WorkerDescriptorProtocol2>(of type: WorkerType) {
    type.decribeSpeciality()
}

let bob2 = OfficeWorker2(fullName: "Bob Black", age: 25, speciality: "I work harder")
describeSpeciality(of: bob2)
