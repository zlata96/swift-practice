import UIKit

protocol MyProtocol {
    func sayHello()
}

//static
extension MyProtocol {
    func sayHello() {
        print("Hello Protocol")
    }
}
//virtual table
class RootClass: MyProtocol {
    func sayHello() {
        
    }
}

class MyClass: RootClass {
    override func sayHello() {
        print("Hello Class")
    }
}



var myClassInstance = MyClass()
var myClassInstance2: RootClass = MyClass()

myClassInstance.sayHello()
myClassInstance2.sayHello()
