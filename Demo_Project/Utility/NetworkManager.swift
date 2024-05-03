//
//  NetworkManager.swift
//  Demo_Project
//
//  Created by Shubham Ramani on 03/05/24.
//

import Foundation

class NetworkManager {
  static let shared = NetworkManager()
  private let baseUrl = "https://jsonplaceholder.typicode.com/posts"

  func getPosts(page: Int, completion: @escaping ([Post]?, Error?) -> Void) {
    let urlString = "\(baseUrl)?_page=\(page)&_limit=10"
    guard let url = URL(string: urlString) else { return }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      guard let data = data, error == nil else {
        completion(nil, error)
        return
      }

      do {
        let decoder = JSONDecoder()
        let posts = try decoder.decode([Post].self, from: data)
        completion(posts, nil)
      } catch {
        completion(nil, error)
      }
    }
    task.resume()
  }
}
