import UIKit

var lesson2 = "Quality of service"
//высокое и низкое
// процессор один и на высокие выделяется больше времени на работу, при низком - меньше, их после обрабатывает

var pthread = pthread_t(bitPattern: 0)
var atribute = pthread_attr_t()
pthread_attr_init(&atribute)
pthread_attr_set_qos_class_np(&atribute, QOS_CLASS_USER_INITIATED, 0)

pthread_create(&pthread, &atribute, { pointer in
    print("test")
    pthread_attr_set_qos_class_np(&atribute, QOS_CLASS_BACKGROUND, 0)
    return nil
}, nil)

let nsThread = Thread {
    print("test")
    print(qos_class_self())
}
nsThread.qualityOfService = .userInteractive
nsThread.start()

print(qos_class_main())

// все, что ниже default будет работать дольше, все, что выше, ожидается юзером здесь и сейчас
