//
//  ContentView.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    
    // Instance of the Network Manager that is observable so its marked as a Observed Object
    @ObservedObject  var networkManager = NetworkManager()
    
    var body: some View {
        // Navigation View with some back features build in
        NavigationView {
            // List view for lopping over an array that is a table view
            List(networkManager.posts) { post in
                // Part of the Navigation view that routes to  detail view with data from the looped over item
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            } .navigationBarTitle("H4XOR News")
        }
        .onAppear {
            // Using the Navigation View modifier for when it appears or is active run the block of code
            
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
