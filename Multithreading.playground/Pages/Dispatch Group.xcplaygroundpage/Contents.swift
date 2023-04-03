import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let imageURLs = ["https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "https://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png", "https://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png"]

class DispatchGroupTest1 {
    private let queueSerial = DispatchQueue(label: "The Swift Developers")
    private let groupRed = DispatchGroup()

    func loadInfo() {
        queueSerial.async(group: groupRed) {
            sleep(1)
            print("1")
        }

        queueSerial.async(group: groupRed) {
            sleep(1)
            print("2")
        }

        groupRed.notify(queue: .main) {
            print("Finish all")
        }
    }
}

let dispatchGroupTest1 = DispatchGroupTest1()
//dispatchGroupTest1.loadInfo()

class DispatchGroupTest2 {
    private let queueConcurrent = DispatchQueue(label: "The Swift Developers1", attributes: .concurrent)
    private let groupBlack = DispatchGroup()

    func loadInfo() {

        groupBlack.enter()

        queueConcurrent.async() {
            sleep(1)
            print("1")
            self.groupBlack.leave()
        }

        groupBlack.enter()
        queueConcurrent.async() {
            sleep(1)
            print("2")
            self.groupBlack.leave()
        }
        groupBlack.wait()
        print("Finish all")
        groupBlack.notify(queue: .main) {
            print("groupBlack finish all")
        }
    }
}

let dispatchGroupTest2 = DispatchGroupTest2()
//dispatchGroupTest2.loadInfo()

// DEMO:

class FourImages: UIView {
    public var ivs = [UIImageView]()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))

        ivs.append(UIImageView(frame: CGRect(x: 0, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 400, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 400, width: 100, height: 100)))

        for i in 0...7 {
            ivs[i].contentMode = .scaleAspectFit
            self.addSubview(ivs[i])
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var view = FourImages(frame: CGRect(x: 0, y: 0, width: 700, height: 900))
view.backgroundColor = .red

var images = [UIImage]()

PlaygroundPage.current.liveView = view

func asyncLoadImage(imageURL: URL,
                    runQueue: DispatchQueue,
                    completionQueue: DispatchQueue,
                    completion: @escaping (UIImage?, Error?) -> ()) {
    runQueue.async {
        do {
            let data = try Data(contentsOf: imageURL)
            completionQueue.async {
                completion(UIImage(data: data), nil)
            }
        } catch let error  {
            completionQueue.async {
                completion(nil, error)
            }
        }
    }
}

func asyncGroup() {
    let aGroup = DispatchGroup()
    for i in 0...3 {
        aGroup.enter()
        asyncLoadImage(imageURL: URL(string: imageURLs[i])!, runQueue: .global(), completionQueue: .main) { result, error in
            guard let image1 = result else {
                return
            }
            images.append(image1)
            aGroup.leave()
        }
    }
    aGroup.notify(queue: .main) {
        for i in 0...3 {
            view.ivs[i].image = images[i]
        }
    }
}

//URL session

func asyncURLSession() {
    for i in 4...7 {
let url = URL(string: imageURLs[i - 4])
        let request = URLRequest(url: url!)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                view.ivs[i].image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}

asyncURLSession()
asyncGroup()
