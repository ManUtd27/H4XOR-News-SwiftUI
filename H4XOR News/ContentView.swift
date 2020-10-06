//
//  ContentView.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    
  @ObservedObject  var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .navigationTitle("H4XOR News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
