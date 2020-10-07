//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation

class NetworkManager: ObservableObject {
    
    /// The published array of posts
    @Published var posts = [Post]()
    
    /// Used the fetch data from the hacker news api. Creates a URL string, session, task, and decodes JSON data. Then publishes the results via observables
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
    
                }
            }
            task.resume()
        }
    }
}
