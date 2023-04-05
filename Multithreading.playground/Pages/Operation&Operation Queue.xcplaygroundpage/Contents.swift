//operation абстрактный класс, представляющий код и данные, связанные с одной задачей
// или законченная задача, являющаяся абстрактным классом, который представляет потоко-безопасную структуру для моделирования состояния операции и ее приоритетов
// напрмеир, обычный блок с замыканием

//operation queue абстрактная структура данных с приоритетами и готовностью. После добавления в операционную очередь операция остается в очереди, пока не сообщит, что она завершена с ее задачей
// life cycle operation 1.отложенная, готова к выполнению, выполняется, закончена
// пока не закончена, можно отменить выполнение (основное отличие от GCD, где exit or cancel возможен только перед выполнением , до того как добавилось в очередь (тк очередь захватывает и не может уже отдать))
// наследник NSObject - у свифта нативного нет фреймворка для многопоточности, но есть у objc
// похож на класс thread (тоже есть main, start)
//можно чекнуть состояние (isExecuting, isReady etc)
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let str = "Operation and OperationQueue"

print(Thread.current)

//просто блок кода, не operation
//let operation = {
//    print("Start")
//    print(Thread.current)
//    print("Finish")
//}
//
//let queue = OperationQueue()
//queue.addOperation(operation)

var result: String?
let concatOperation = BlockOperation {
    result = "The Swift"

        print(Thread.current)
}

let queue = OperationQueue()
queue.addOperation(concatOperation)
print(result!)

let queue1 = OperationQueue()
queue1.addOperation {
    print("test")
    print(Thread.current)
}

class MyThread: Thread {
    override func main() {
        print("Test main Thread")
    }
}

let myThread = MyThread()
myThread.start()

class OperstionA: Operation {
    override func main() {
        print("Test operation A")
        print(Thread.current)
    }
}

let operstionA = OperstionA()
//operstionA.start()

let queue2 = OperationQueue()
print(Thread.current)
queue2.addOperation(operstionA)
