//
//  PostData.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation

/// The structor of the results comming back for hacker news api
struct Results: Decodable {
    let hits: [Post]
}

/// What a individual post should look like from hacker new api
struct Post: Decodable, Identifiable {
    var id: String {
       return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
