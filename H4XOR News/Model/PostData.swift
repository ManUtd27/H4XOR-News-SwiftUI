//
//  PostData.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation

/// The structor of the results comming back for hacker news api
// This sturcture is used to as guidline for the JSONDecoder to decode the data returned from the networking request
struct Results: Decodable {
    let hits: [Post]
}

/// What a individual post should look like from hacker news api
// This sturcture is used to as guidline for the JSONDecoder to decode the data returned from the networking request
struct Post: Decodable, Identifiable {
    var id: String {
       return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
