import UIKit

// Проблемы с многопоточностью
// Race condition (условия гонки): с несколькими потоками при работе с одними данными, в таком случае данные становятся непредсказуемыми и зависят от порядка вы полнения потоков
// Resourse contention (конкуренция за ресурс): потоки, выполняющие разные задачи, пытаются получить дсотуп к ресурсу, из-за чего время безопасного получения ресурса увеличивается, что приводит к непредсказуемому результату
// Deadlock (вечная блокировка): несколько потоков блокируют друг друга
// Starvation (голодание): поток не может поулчить доступ к ресурсу и повторяет это снова и снова
// Priority invension (инверсия приоритетов): поток с низким приоритетом удерживает ресурс, необходимый потоку с высоким приоритетом
// Non-deterministic and Fairness (неопределенность и справедливость): мы не омжем делать предположений когда и в каком порядке поток получит доступ к ресурсу, задержка не может быть определена априори и в значительной степени зависит от количества конфликтов. Однако примитивы синхронизации могут обеспечить справедливость, гарантируя доступ ожидающим потокам, учитывая порядок.

// NSlock не должен использоваться в реализации рекурсивной блокировки, иначе это приведет к Deadlock или Starvation

// Unix

let str = "NSRecursiveLock"



class RecursiveMutexTest {
    private var mutex = pthread_mutex_t()
    private var atribute = pthread_mutexattr_t()
    init() {
        pthread_mutexattr_init(&atribute)
        pthread_mutexattr_settype(&atribute, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &atribute)
    }

    func firstTask() {
        pthread_mutex_lock(&mutex)
twoTask()
        do {
            pthread_mutex_unlock(&mutex)
        }
    }
    private func twoTask() {
        pthread_mutex_lock(&mutex)
print("finish")
        do {
            pthread_mutex_unlock(&mutex)
        }
    }
}

var recursive = RecursiveMutexTest()
recursive.firstTask()

let recursiveLock = NSRecursiveLock()

class RecursiveThread:Thread {
    override func main() {
        recursiveLock.lock()
        print("Thread aquired lock")
        callMe()
        do {
            recursiveLock.unlock()
        }
        print("Exit main")
    }

    func callMe() {
        recursiveLock.lock()
        print("Thread callMe aquired lock")
        do {
            recursiveLock.unlock()
        }
        print("Exit callMe")
    }
}

let thread = RecursiveThread()
thread.start()
