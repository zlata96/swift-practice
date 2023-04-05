import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let str = "Operation and OperationQueue"

let operationQueue = OperationQueue()
class OperationCancelTest: Operation {
    override func main() {
        if isCancelled {
            print("isCancelled", isCancelled)
            return
        }
        print("test1")
        sleep(1)

        if isCancelled {
            print("isCancelled", isCancelled)
            return
        }


        print("test2")
    }
}
func cancelOperationMethod() {
        let cancelOperation  = OperationCancelTest()
    operationQueue.addOperation(cancelOperation)
    cancelOperation.cancel()
    }

cancelOperationMethod()

class WaitOperationTest: Operation {
let operationQueue = OperationQueue()
    func test() {
        operationQueue.addOperation {
            sleep(1)
            print("test1")
        }
        operationQueue.addOperation {
            sleep(2)
            print("test2")
        }
        operationQueue.waitUntilAllOperationsAreFinished()
        operationQueue.addOperation {
            print("test3")
        }
        operationQueue.addOperation {
            print("test4")
        }
    }
}

let waitOperationTest = WaitOperationTest()
waitOperationTest.test()

class WaitOperationTest2: Operation {
let operationQueue = OperationQueue()
    func test() {

        let operation1 = BlockOperation {
            sleep(1)
            print("test1")
        }
        let operation2 = BlockOperation {
            sleep(1)
            print("test2")
        }

        operationQueue.addOperations([operation1, operation2], waitUntilFinished: false)
    }
}

let waitOperationTest2 = WaitOperationTest2()
waitOperationTest2.test()


class CompletionBlock: Operation {
    let operationQueue = OperationQueue()
        func test() {

            let operation1 = BlockOperation {
                print("test1 CompletionBlock")
            }
            operation1.completionBlock = {
                print("finish CompletionBlock")
            }
            operationQueue.addOperation(operation1)
        }
}

let completionBlock = CompletionBlock()
completionBlock.test()
