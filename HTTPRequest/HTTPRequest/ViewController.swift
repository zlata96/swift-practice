//  ViewController.swift
//  HTTPRequest
//
//  Created by Zlata Guseva
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var array = [String]()
    let key = "c8TvrV5RLFFziOP7Rwqyl0i6E8NE7wRu"
    let url = "http://api.apilayer.com/fixer/convert?to=to&from=from&amount=amount&apikey=c8TvrV5RLFFziOP7Rwqyl0i6E8NE7wRu"


    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getPrice(url: "\(url)\(key)")
    }

    func getPrice(url: String) {
        AF.request(url).responseJSON { response in
            print(response)
        }
    }
    func setupURL() -> URLRequest {
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
           request.httpMethod = "GET"
           request.addValue(key, forHTTPHeaderField: "apikey")
        return request
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
}

