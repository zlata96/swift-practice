//  ViewController.swift
//  URLSessionExample
//
//  Created by Zlata Guseva
//

import UIKit

class ViewController: UIViewController {
    var imageWidth = ""
    var imageHeight = ""


    @IBAction func buttonPressed(_ sender: Any) {
        let api = "https://picsum.photos/" + imageWidth + "/" + imageHeight
        guard let apiURL = URL(string: api) else {
            fatalError("Error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) { data, response, error in
            guard let data = data, error == nil else {return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let height = imageView.bounds.height
        self.imageHeight = String(format: "%.0f", Double(height))
        let width = imageView.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))
    }


}

