import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "GCD Semaphores" // если mutex работает с одним потоком, то semaphore работает с тем количестовом, которое мы укажем в счетчике (одновременно работает)

let queue = DispatchQueue(label: "The swift Developers", attributes: .concurrent)

let semaphore = DispatchSemaphore(value: 0) //в одной очереди будет пропущены два потока

queue.async {
    semaphore.wait() // у value -1
    sleep(3)
    print("method 1")
    semaphore.signal() //к value +1
}
queue.async {
    semaphore.wait() // у value -1
    sleep(3)
    print("method 2")
    semaphore.signal() //к value +1
}
queue.async {
    semaphore.wait() // у value -1
    sleep(3)
    print("method 3")
    semaphore.signal() //к value +1
}

let semaphore2 = DispatchSemaphore(value: 0)
semaphore2.signal()
DispatchQueue.concurrentPerform(iterations: 10) { (id: Int) in
    semaphore2.wait(timeout: DispatchTime.distantFuture)
    print("Block", String(id))
    semaphore2.signal()
}

class SemaphoreTest {
    private let sem = DispatchSemaphore(value: 2)
    var array = [Int]()

    private func methodWork(_ id: Int) {
        sem.wait()
        array.append(id)
        print("test array", array.count)
        Thread.sleep(forTimeInterval: 2)
        sem.signal()
    }

    func startAllThread()
    {
        DispatchQueue.global().async {
            self.methodWork(11)
        }
        DispatchQueue.global().async {
            self.methodWork(1233)
        }
        DispatchQueue.global().async {
            self.methodWork(1221)
        }
        DispatchQueue.global().async {
            self.methodWork(14551)
        }
        DispatchQueue.global().async {
            self.methodWork(161)
        }
        DispatchQueue.global().async {
            self.methodWork(181)
        }
    }
}

let semaphoreTest = SemaphoreTest()
semaphoreTest.startAllThread()
