//  ApiManager.swift
//  Basic Request
//
//  Created by Zlata Guseva
//

import Foundation

enum ApiType {

    case logIn
    case getUsers
    case getPosts
    case getAlboms

    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }

    var headers: [String: String] {
        switch self {
        case .logIn: return ["authToken": "12345"]
        default: return [:]
        }
    }

    var path: String {
        switch self {
        case .logIn: return "login"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        case .getAlboms: return "alboms"
        }
    }

    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL))!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .logIn:
            request.httpMethod = "POST"
        default:
            request.httpMethod = "GET"
        }
        return request
    }
}

class ApiManager {
    static let shared = ApiManager()
    func getUsers(completion: @escaping (Users) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users =  try? JSONDecoder().decode(Users.self, from: data) {
                completion(users)
            } else {
                completion([])
            }
        }
        task.resume()
    }
}

