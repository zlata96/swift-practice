//  ViewController.swift
//  HTTPRequest
//
//  Created by Zlata Guseva
//

import UIKit

class ViewController: UIViewController {
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    var dataSource = [Post]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
obtainPosts()
        tableView.dataSource = self
    }

    func obtainPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return }
        session.dataTask(with: url) {[weak self] data, response, error in
            guard let strongSelf = self else {return }
            if error == nil, let parsData = data {
                guard let posts = try? strongSelf.decoder.decode([Post].self, from: parsData) else {return }
                strongSelf.dataSource = posts

                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                }
            } else {
                print("Error is \(error?.localizedDescription)")
            }
        }.resume()
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

