//  Albums.swift
//  Basic Request
//
//  Created by Zlata Guseva
//

import Foundation

struct Album: Codable {
    let userID, id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [Album]
