//  ViewController.swift
//  HTTPRequest
//
//  Created by Zlata Guseva
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let networkManager = NetworkManager()
    var dataSource = [Post]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        networkManager.obtainPosts { [weak self] (result) in
            switch result {
            case .success(let posts) :
                self?.dataSource = posts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        let post = dataSource[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
}

