// Locks

import UIKit

//похож на мюьтекс,может защитить запись или чтение, то есть только get or set or get and set

class ReadWriteLock {
private var lock = pthread_rwlock_t()
    private var attribute = pthread_rwlockattr_t()

    private var globalProperty:Int = 0

    init() {
        pthread_rwlock_init(&lock, &attribute)
    }

    var workProperty: Int {
        get {
            pthread_rwlock_wrlock(&lock)
            let temp = globalProperty
            pthread_rwlock_unlock(&lock)
            return temp
        }
        set {
            pthread_rwlock_wrlock(&lock)
            globalProperty = newValue
            pthread_rwlock_unlock(&lock)
        }
    }
}
// до iOS 10.0 устарел, вероятно, потому что построен на том, что к нему постоянное обращение
//class SpinLock {
//    private var lock = OS_SPINLOCK_INIT
//    func some() {
//        OSSpinLockLock(&lock)
//        OSSpinLockUnLock(&lock)
//    }
//}

// с iOS 10.0
class UnfairLock {
    private var lock = os_unfair_lock_s()
    var array = [String]()
    func some() {
os_unfair_lock_lock(&lock)
        array.append("ab")
        os_unfair_lock_unlock(&lock)
    }
}

class SynchronizedObjc {
    private let lock = NSObject()
    var array = [Int]()
    func some() {
        objc_sync_enter(lock)
        array.append(1)
        objc_sync_exit(lock)
    }
}
