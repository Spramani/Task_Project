//
//  Model.swift
//  Demo_Project
//
//  Created by Shubham Ramani on 03/05/24.
//

import Foundation

struct Post: Decodable {
  let id: Int
  let title: String
  let body: String
  // Add other properties as needed
  
  var computedDetails: String? // To store pre-computed details (optional)
}

