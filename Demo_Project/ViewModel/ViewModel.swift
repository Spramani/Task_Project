//
//  ViewModel.swift
//  Demo_Project
//
//  Created by Shubham Ramani on 03/05/24.
//

import Foundation

class PostListViewModel {
  private var currentPage = 1
  private var posts = [Post]()

  func fetchPosts(completion: @escaping ([Post]?, Error?) -> Void) {
    NetworkManager.shared.getPosts(page: currentPage) { [weak self] newPosts, error in
      guard let self = self else { return }
      if let error = error {
        // Handle error
        completion(nil, error)
        return
      }
      self.currentPage += 1
      self.posts.append(contentsOf: newPosts!)
      completion(newPosts, nil)
    }
  }

  func computeDetails(for post: Post) -> String {
    // Implement your heavy computation logic here
    // ...
    let details = "Computed Details" // Replace with actual calculation
    return details
  }

  func getDetails(for post: inout Post) -> String? {
    if let cachedDetails = post.computedDetails {
      return cachedDetails
    } else {
      let details = computeDetails(for: post)
      post.computedDetails = details
      return details
    }
  }

  func numberOfPosts() -> Int {
    return posts.count
  }

  func getPost(at index: Int) -> Post {
    return posts[index]
  }
}
