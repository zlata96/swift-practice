//  ViewController.swift
//  Basic Request
//
//  Created by Zlata Guseva.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.shared.getUsers { users in
            print(users.count)
        }
    }
}

