import UIKit

//Thread
//Operation
//GCD - фокус на задачах, а не на потоке

// паралелльная очередь
// 1: ----
// 2: ----

// последовательная
// 1:- - -
// 2: - -

// асинхронная
// 1(main) UI ---------
// 2:              -


// Unix - POSIX

var thread = pthread_t(bitPattern: 0) // создаем поток
var attribut = pthread_attr_t()
pthread_attr_init(&attribut)
pthread_create(&thread, &attribut, { (pointer) in
    print("test")
    return nil
}, nil)

// 2 Thread оболочка objc

var nsThread = Thread {
    print("test")
}
nsThread.start()

