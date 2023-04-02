import UIKit
import PlaygroundSupport

var str = "AssyncAfter"

class MyViewController: UIViewController {
    var button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "vc 1"
        view.backgroundColor = .white
       button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }

    func initButton() {
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
    }
@objc
    func buttonPressed() {
        print("pressed")
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(),  completion: @escaping  ()->()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }
}

class SecondViewController: UIViewController {
    var button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "vc 2"
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)


//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            // если необходимо подряд запустить что-то, вместо обычного цикла, ра
//            DispatchQueue.concurrentPerform(iterations: 20000) {
//                        print("\($0)times")
//                        print(Thread.current)
//                    }
//        }
myInActiveQueue()
    }

    func myInActiveQueue() {
        let inactiveQueue = DispatchQueue(label: "The Swift Developers", attributes: [.concurrent, .initiallyInactive])
        // initiallyInactive - queue делаем управляемой
        inactiveQueue.async {
            print("Done!")
        }
        print("not yet started")
        inactiveQueue.activate()
        print("activate!")
        inactiveQueue.suspend()
        print("Pause")
        inactiveQueue.resume()
        print("free")
    }

        override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initButton()
    }

    func initButton() {
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        button.center = view.center
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
    }
@objc
    func buttonPressed() {
        let vc = MyViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
let vc1 = MyViewController()
let navBar = UINavigationController(rootViewController: vc1)

PlaygroundPage.current.liveView = navBar


