//  ViewController.swift
//  URLSessionExample
//
//  Created by Zlata Guseva
//

import UIKit

class ViewController: UIViewController {


    @IBAction func buttonPressed(_ sender: Any) {
        let api = "https://picsum.photos/200/300"
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

    }


}

