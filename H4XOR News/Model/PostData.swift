//
//  PostData.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
       return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
