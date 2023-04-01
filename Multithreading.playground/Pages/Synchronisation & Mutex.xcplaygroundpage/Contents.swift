import UIKit

// избежать коллизии данных (если в одном потоке читаем, в другом добавляем и тп), ставим в очередь через mutex (работают быстрее, чем GCD, но свои ньюансы)

// mutex - защита объекта от доступа к нему из другого потока, отличного от того, который завладел мьютексом
// если другому потоку нужен доступ, то поток блокируется (засыпает)
// mutex может блокировать и освобождать объект

class SafeThread {
    private var mutex = pthread_mutex_t()
    init() {
        pthread_mutex_init(&mutex, nil)
    }
    func someMethod(completion: () ->()) {
        pthread_mutex_lock(&mutex)
        completion()
        do {
            pthread_mutex_unlock(&mutex)
        }
        // гарантированно освобождает поток
    }
}

class SafeThreadNS {
    private let lockMutex = NSLock()

    func someMethod(completion: () ->()) {
        lockMutex.lock()
        completion()
        do {
            lockMutex.unlock()
        }
    }
}

//
var array = [String]()
let safeThread = SafeThread()

safeThread.someMethod {
    print("test")
    array.append("1 thread")
}
array.append("2 thread")
print(array)

var arrayNS = [String]()
let safeThreadNS = SafeThreadNS()

safeThreadNS.someMethod {
    print("test")
    arrayNS.append("1 thread")
}
arrayNS.append("2 thread")
print(arrayNS)
