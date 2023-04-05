// интерфейс для мониторинга низкоуровневых системных объектов, порты, unix сигналы и тп
// позволяет получать уведомления от файловой системы, напрмиер, об изменении файла, перемещении и тп; socket operations - непрерывный канал между  socket и устройством
// можно поулчать уведомления, что файлы готовы к отправке, о передаче каких-либо байтов
// много протоколов
// можно реализовать свои системные уведомления

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let str = "DispatchSource"

let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
timer.setEventHandler{
    print("!")
}

timer.schedule(deadline: .now(), repeating: 5)
timer.activate()

