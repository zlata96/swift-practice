import UIKit

var str = "NSCondition()"

//если создаем два потока, нет гарантии в какое время придет каждый из них, в каком порядке будут выполняться
// в одном потоке хотим записать что то, другой поток должен распечатать, то риск получить нил или пустой массив
// выстраиваем в очередь через сигналы, например, просим подождать, пока не выполнится другой поток, либо ждать до определенного времени

// MARK: UNIX

var available = false
var condition = pthread_cond_t()
var mutex = pthread_mutex_t()

class ConditionMutexPrinter: Thread {
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    override func main() {
        printerMethod()
    }

    private func printerMethod() {
        pthread_mutex_lock(&mutex)
        print("Printer enter")
        while (!available) {
            pthread_cond_wait(&condition, &mutex)
        }
        available = false
        do {
            pthread_mutex_unlock(&mutex)
        }
        print("Printer exit")
    }
}

class ConditionMutexWriter: Thread {
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    override func main() {
        writerMethod()
    }

    private func writerMethod() {
        pthread_mutex_lock(&mutex)
        print("Writer enter")
        pthread_cond_signal(&condition)
        available = true
        str = str + "a"
        print(str)
        do {
            pthread_mutex_unlock(&mutex)
        }
        print("Writer exit")
    }
}


// MARK: DEMO
let conditionWriter = ConditionMutexWriter()
let conditionPrinter = ConditionMutexPrinter()

conditionWriter.start()
conditionPrinter.start()

// MARK: NSCondition
let condition1 = NSCondition()
var isAvailable = false

class WriterThread: Thread {

    override func main() {
        condition1.lock()
        print("Writer enter")
        isAvailable = true
        condition1.signal()
        condition1.unlock()
        print("Writer exit")
    }
}

class PrinterThread: Thread {

    override func main() {
        condition1.lock()
        print("Printer enter")
        while !isAvailable {
            condition1.wait()
        }
        isAvailable = false
        condition1.unlock()
        print("Printer exit")
    }
}

// MARK: DEMO Thread
let conditionWriter1 = WriterThread()
let conditionPrinter1 = PrinterThread()

conditionPrinter1.start()
conditionWriter1.start()

