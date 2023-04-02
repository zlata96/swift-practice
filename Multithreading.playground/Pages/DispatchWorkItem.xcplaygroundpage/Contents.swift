//: [Previous](@previous)

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var str = "DispatchWorkItem"
// надстройка над задачей (замыканием), позволяет остановить, методы уведомления, вызов в определенном потоке, ожидание, ожидание конкретного периода времени
// рабочая область, в которую мы можем поместить задачи

let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!

class DispatchWorkItem1 {
    private var queue = DispatchQueue(label: "DispatchWorkItem1", attributes: .concurrent)

    func create() {
        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start task")
        }
        workItem.notify(queue: .main) {
            print(Thread.current)
            print("Finished task")
        }
        queue.async(execute: workItem)
    }
}

//var dispatchWorkItem1 = DispatchWorkItem1()
//dispatchWorkItem1.create()

class DispatchWorkItem2 {
    private var queue = DispatchQueue(label: "DispatchWorkItem1")

    func create() {
        queue.async {
            sleep(1)
            print(Thread.current)
            print("Task1")
        }

        queue.async {
            sleep(1)
            print(Thread.current)
            print("Task2")
        }

        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start workItemTask")
        }
        queue.async(execute: workItem)
        workItem.cancel()
        // cancel только в отношении задач, которые еще не начали выполняться, в противном случае не сработает (но operation сможет)
    }
}

//var dispatchWorkItem2 = DispatchWorkItem2()
//dispatchWorkItem2.create()

var view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))

image.backgroundColor = .yellow
image.contentMode = .scaleAspectFit
view.addSubview(image)

PlaygroundPage.current.liveView = view


// classic way

func fetchImage1() {
    let queue = DispatchQueue.global(qos: .utility)

    queue.async {
        if let data = try? Data(contentsOf: imageURL) {
            DispatchQueue.main.async {
                image.image = UIImage(data: data)
            }
        }
    }
}

//fetchImage1()

// Dispatch work item way

func fetchImage2() {
    var data: Data?
    let queue = DispatchQueue.global(qos: .utility)
    let workItem = DispatchWorkItem(qos: .userInteractive) {
        data = try? Data(contentsOf: imageURL)
        print(Thread.current)
    }
    queue.async(execute: workItem)
    workItem.notify(queue: DispatchQueue.main) {
        if let imageData = data {
            image.image = UIImage(data: imageData)
        }
    }
}

// fetchImage2()

// URLSession (work async)

func fetchImage3() {
    let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
        print(Thread.current)
        if let imageData = data {
            DispatchQueue.main.async {
                print(Thread.current)
                            image.image = UIImage(data: imageData)
                        }
        }
    }
    task.resume()
}

fetchImage3()
