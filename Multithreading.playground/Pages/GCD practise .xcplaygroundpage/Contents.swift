import UIKit
import PlaygroundSupport

var str = "GCD"

// шаги к успеху
// 1. выбираем очередь DispatchQueue.global or DispatchQueue.main
// 2. выбираем приоритет qos:
// .userInteractive, .userInitiated, .utility - наивысший
// .default - по умолчанию (его даже не задаем )
// .background - самый низкий
// 3. выбираем порядок выполнения: .sync .async

// шаги к неуспеху:  никогда не вызывайте sync на main queue - приведет к deadlock

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
}

class SecondViewController: UIViewController {
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "vc 2"
        view.backgroundColor = .white
        loadPhoto()
    }

        override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initImage()
    }

    func initImage() {
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center

        imageView.backgroundColor = .red

        view.addSubview(imageView)
    }

    func loadPhoto() {
        let imageURL: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }

            }
        }
    }

}
let vc1 = MyViewController()
let navBar = UINavigationController(rootViewController: vc1)

PlaygroundPage.current.liveView = navBar


