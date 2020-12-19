//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation

class NetworkManager: ObservableObject {
    
    /// The published array of posts
    // This is part reactive programming and the Observer Design Pattern
    @Published var posts = [Post]()
    
    /// Used the fetch data from the hacker news api. Creates a URL string, session, task, and decodes JSON data. Then publishes the results via observables
    func fetchData(){
        // Creates a URL from a string
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            // Creates a URL session object from the URLSession class init with a default configuration
            let session = URLSession(configuration: .default)
            // Creates a task with the session data Task that takes a URL with a completion handler that returns the data, response and any errors from the request
            let task = session.dataTask(with: url) { (data, response, error) in
                // Inside the clousre to check if the error return from request is nill and procedd if there were no errors and have some data
                if error == nil {
                    // Creates a decoder from the JSONDecoder to try and decode the data we get back from the networking session
                    // In order to decode the data we need to create a stucture to represent all the data we want out of the data. Located in PostData.swift file
                    let decoder = JSONDecoder()
                    // If data can be safely unwrapped and contains data proceed
                    if let safeData = data {
                        // The decoding process could throw exception therefore wrap the process in a do catch block
                        do {
                            // Use the JSONDecoder and the Results structure to decode the data returned from the networking request and store in results constant
                           let results = try decoder.decode(Results.self, from: safeData)
                            // The networking process happens async therefore any updates must be done in the main thread using dispatch que
                            DispatchQueue.main.async {
                                // Set the results hits from the networking request to the variable post that is part of a observable object
                                self.posts = results.hits
                            }
                        } catch {
                            // Print out any error caught by the decodeing process block
                            print(error)
                        }
                    }
    
                }
            }
            // This entire netwokring task with the session data and url must be started or resumed
            task.resume()
        }
    }
}
