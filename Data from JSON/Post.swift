//
//  Post.swift
//  Data from JSON
//
//  Created by Admin on 1/14/21.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
